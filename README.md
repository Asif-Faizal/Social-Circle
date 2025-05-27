# Social Circle - Flutter gRPC Implementation Guide

This guide explains how to implement a gRPC-based feature in Flutter using Clean Architecture, BLoC pattern, and Freezed for code generation.

## Project Structure

```
lib/
├── core/
│   ├── injection/
│   │   └── injection_container.dart
│   └── routing/
│       ├── routing_constants.dart
│       ├── routing_arguments.dart
│       └── routing_service.dart
├── feature/
│   └── auth/
│       ├── data/
│       │   ├── datasources/
│       │   │   └── check_email_remote_datasource.dart
│       │   ├── models/
│       │   │   └── check_email_response_model.dart
│       │   └── repositories/
│       │       └── check_email_repository_impl.dart
│       ├── domain/
│       │   ├── entities/
│       │   │   └── check_email.entity.dart
│       │   ├── repositories/
│       │   │   └── check_email_repository.dart
│       │   └── usecases/
│       │       └── check_email.usecase.dart
│       └── presentation/
│           └── bloc/
│               └── check_email/
│                   ├── check_email_bloc.dart
│                   ├── check_email_event.dart
│                   └── check_email_state.dart
└── protos/
    └── auth.proto
```

## Implementation Steps

### 1. Setup Dependencies

Add the following to your `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_bloc: ^8.1.3
  freezed_annotation: ^2.4.1
  grpc: ^3.2.4
  injectable: ^2.3.2
  get_it: ^7.6.4

dev_dependencies:
  build_runner: ^2.4.7
  freezed: ^2.4.6
  injectable_generator: ^2.4.1
```

### 2. Define Proto File

Create `protos/auth.proto`:

```protobuf
syntax = "proto3";

package auth;

service AuthService {
  rpc CheckEmail (CheckEmailRequest) returns (CheckEmailResponse) {}
}

message CheckEmailRequest {
  string email = 1;
}

message CheckEmailResponse {
  bool is_registered = 1;
}
```

### 3. Create Entity

Create `lib/feature/auth/domain/entities/check_email.entity.dart`:

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_email.entity.freezed.dart';

@freezed
class CheckEmailEntity with _$CheckEmailEntity {
  const factory CheckEmailEntity({
    required bool isRegistered,
  }) = _CheckEmailEntity;
}
```

### 4. Create Repository Interface

Create `lib/feature/auth/domain/repositories/check_email_repository.dart`:

```dart
import 'package:dartz/dartz.dart';
import '../entities/check_email.entity.dart';
import '../../../../core/error/failures.dart';

abstract class CheckEmailRepository {
  Future<Either<Failure, CheckEmailEntity>> checkEmail(String email);
}
```

### 5. Create UseCase

Create `lib/feature/auth/domain/usecases/check_email.usecase.dart`:

```dart
import 'package:injectable/injectable.dart';
import '../repositories/check_email_repository.dart';

@injectable
class CheckEmailUseCase {
  final CheckEmailRepository repository;

  CheckEmailUseCase(this.repository);

  Future<Either<Failure, CheckEmailEntity>> call(CheckEmailParams params) {
    return repository.checkEmail(params.email);
  }
}

class CheckEmailParams {
  final String email;
  const CheckEmailParams({required this.email});
}
```

### 6. Create Data Models

Create `lib/feature/auth/data/models/check_email_response_model.dart`:

```dart
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/check_email.entity.dart';

part 'check_email_response_model.freezed.dart';
part 'check_email_response_model.g.dart';

@freezed
class CheckEmailResponseModel with _$CheckEmailResponseModel {
  const factory CheckEmailResponseModel({
    required bool isRegistered,
  }) = _CheckEmailResponseModel;

  factory CheckEmailResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CheckEmailResponseModelFromJson(json);

  const CheckEmailResponseModel._();

  CheckEmailEntity toEntity() => CheckEmailEntity(
        isRegistered: isRegistered,
      );
}
```

### 7. Create Remote Data Source

Create `lib/feature/auth/data/datasources/check_email_remote_datasource.dart`:

```dart
import 'package:injectable/injectable.dart';
import '../models/check_email_response_model.dart';
import '../../../../generated/auth.pbgrpc.dart';

abstract class CheckEmailRemoteDataSource {
  Future<CheckEmailResponseModel> checkEmail(String email);
}

@Injectable(as: CheckEmailRemoteDataSource)
class CheckEmailRemoteDataSourceImpl implements CheckEmailRemoteDataSource {
  final AuthServiceClient client;

  CheckEmailRemoteDataSourceImpl(this.client);

  @override
  Future<CheckEmailResponseModel> checkEmail(String email) async {
    final request = CheckEmailRequest()..email = email;
    final response = await client.checkEmail(request);
    
    return CheckEmailResponseModel(
      isRegistered: response.isRegistered,
    );
  }
}
```

### 8. Create Repository Implementation

Create `lib/feature/auth/data/repositories/check_email_repository_impl.dart`:

```dart
import 'package:injectable/injectable.dart';
import '../../domain/repositories/check_email_repository.dart';
import '../datasources/check_email_remote_datasource.dart';

@Injectable(as: CheckEmailRepository)
class CheckEmailRepositoryImpl implements CheckEmailRepository {
  final CheckEmailRemoteDataSource remoteDataSource;

  CheckEmailRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, CheckEmailEntity>> checkEmail(String email) async {
    try {
      final result = await remoteDataSource.checkEmail(email);
      return Right(result.toEntity());
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
```

### 9. Create BLoC Files

Create the following files in `lib/feature/auth/presentation/bloc/check_email/`:

`check_email_event.dart`:

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_email_event.freezed.dart';

@freezed
class CheckEmailEvent with _$CheckEmailEvent {
  const factory CheckEmailEvent.checkEmail(String email) = _CheckEmail;
}
```

`check_email_state.dart`:

```dart
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/check_email.entity.dart';

part 'check_email_state.freezed.dart';

@freezed
class CheckEmailState with _$CheckEmailState {
  const factory CheckEmailState.initial() = _Initial;
  const factory CheckEmailState.loading() = _Loading;
  const factory CheckEmailState.success(CheckEmailEntity data) = _Success;
  const factory CheckEmailState.error(String message) = _Error;

  const CheckEmailState._();

  T maybeWhen<T>({
    T Function()? initial,
    T Function()? loading,
    T Function(CheckEmailEntity data)? success,
    T Function(String message)? error,
    required T Function() orElse,
  }) {
    final v = this;
    if (v is _Initial && initial != null) return initial();
    if (v is _Loading && loading != null) return loading();
    if (v is _Success && success != null) return success((v).data);
    if (v is _Error && error != null) return error((v).message);
    return orElse();
  }
}
```

`check_email_bloc.dart`:

```dart
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/check_email.usecase.dart';
import 'check_email_event.dart';
import 'check_email_state.dart';

class CheckEmailBloc extends Bloc<CheckEmailEvent, CheckEmailState> {
  final CheckEmailUseCase checkEmailUseCase;

  CheckEmailBloc({
    required this.checkEmailUseCase,
  }) : super(const CheckEmailState.initial()) {
    on<CheckEmailEvent>((event, emit) async {
      emit(const CheckEmailState.loading());

      final result = await checkEmailUseCase(
        CheckEmailParams(email: event.email),
      );

      emit(
        result.fold(
          (failure) => CheckEmailState.error(failure.message),
          (data) => CheckEmailState.success(data),
        ),
      );
    });
  }
}
```

### 10. Generate Code

Run the following commands to generate the necessary code:

```bash
# Generate gRPC code
protoc --dart_out=grpc:lib/generated -Iprotos protos/auth.proto

# Generate Freezed and Injectable code
flutter pub run build_runner build --delete-conflicting-outputs
```

### 11. Register Dependencies

Update `lib/core/injection/injection_container.dart`:

```dart
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injection_container.config.dart';

final sl = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  await $initGetIt(sl);
}
```

## Usage

To use the email check functionality in a screen:

```dart
BlocProvider<CheckEmailBloc>(
  create: (context) => sl<CheckEmailBloc>(),
  child: BlocListener<CheckEmailBloc, CheckEmailState>(
    listener: (context, state) {
      state.maybeWhen(
        success: (data) {
          // Handle success
        },
        error: (message) {
          // Handle error
        },
        orElse: () {},
      );
    },
    child: YourWidget(),
  ),
);
```

## Running the Project

1. Start your gRPC server
2. Run Flutter app:

```bash
flutter run
```

## Code Generation Commands

Whenever you make changes to the Freezed classes or Injectable services:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

For continuous code generation during development:

```bash
flutter pub run build_runner watch
```
