import 'package:equatable/equatable.dart';

abstract class RouteArguments extends Equatable {
  const RouteArguments();
  
  @override
  bool get stringify => true;
}

class NotRegisteredArguments extends RouteArguments {
  final String email;

  const NotRegisteredArguments({required this.email});

  @override
  List<Object?> get props => [email];
}

class EnterOtpArguments extends RouteArguments {
  final String email;

  const EnterOtpArguments({required this.email});

  @override
  List<Object?> get props => [email];
}
