import 'package:equatable/equatable.dart';

abstract class RouteArguments extends Equatable {
  const RouteArguments();
  
  @override
  bool get stringify => true;
}