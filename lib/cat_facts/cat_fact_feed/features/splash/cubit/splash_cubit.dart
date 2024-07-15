import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cat_facts/cat_facts/cat_fact_feed/features/splash/cubit/splash_state.dart';


class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState()){
    Timer(const Duration(seconds:3), () {
      emit(state.copyWith(isTimerCompleted: true));
    });
  }
}
