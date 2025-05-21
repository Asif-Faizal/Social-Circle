import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState.initial());

  void startSplashTimer() {
    Timer(const Duration(milliseconds: 1500), () {
      emit(const SplashState.navigateToNext());
    });
  }
} 