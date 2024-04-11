import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../app/service_locator.dart';
import '../../../../config/database/cache/cache_helper.dart';
import '../../../../core/utils/app_enums.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());
  int index = 0;
  final PageController pageController = PageController();
  void setOnBoarding() async {
    sl<CacheHelper>().saveData(
        key: MySharedKeys.onBoarding.name, value: MySharedKeys.onBoarding.name);
  }

  void nextOrForward(int value) {
    emit(InitialValue());
    index = value;
    emit(ValueChanged());
  }
}
