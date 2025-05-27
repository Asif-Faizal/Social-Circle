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
  final bool isRegister;

  const EnterOtpArguments({required this.email, required this.isRegister});

  @override
  List<Object?> get props => [email, isRegister];
}

class PasswordArguments extends RouteArguments {
  final String email;
  final bool isRegister;

  const PasswordArguments({required this.email, required this.isRegister});

  @override
  List<Object?> get props => [email];
}
