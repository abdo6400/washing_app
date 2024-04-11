import 'package:car_studio/config/locale/app_localizations.dart';
import 'package:car_studio/core/utils/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_values.dart';

import '../../../config/routes/app_routes.dart';
import '../../../core/components/default_components/default_appbar.dart';
import '../../../core/components/default_components/default_button.dart';
import '../cubit/onboarding_cubit.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final List<IntroItem> introItems = const [
    IntroItem(
      image: AppImages.onBoarding1,
      title: AppStrings.onboarding1,
      subtitle: AppStrings.onboardingSub1,
    ),
    IntroItem(
      image: AppImages.onBoarding2,
      title: AppStrings.onboarding2,
      subtitle: AppStrings.onboardingSub2,
    ),
    IntroItem(
      image: AppImages.onBoarding3,
      title: AppStrings.onboarding3,
      subtitle: null,
    )
  ];

  Widget _pageBuilder(context, index) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: AppValues.paddingWidth * 20),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                bottom: (introItems[index].subtitle != null)
                    ? AppValues.sizeHeight * 250
                    : 0,
              ),
              child: Image.asset(
                introItems[index].image!,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            (introItems[index].subtitle == null)
                ? Positioned(
                    top: AppValues.sizeHeight * 5,
                    right: AppValues.paddingWidth * 50,
                    left: AppValues.paddingWidth * 50,
                    child: Text(
                      introItems[index].title!.tr(context).toUpperCase(),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontSize: AppValues.font * 34,
                            fontWeight: FontWeight.bold,
                            letterSpacing: AppValues.sizeWidth * 2,
                            color: AppColors.white,
                          ),
                    ),
                  )
                : Positioned(
                    bottom: AppValues.paddingHeight * 100,
                    right: AppValues.paddingWidth * 10,
                    left: AppValues.paddingWidth * 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          introItems[index].title!.tr(context),
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontSize: AppValues.font * 34,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.white,
                                  ),
                        ),
                        SizedBox(
                          height: AppValues.sizeHeight,
                        ),
                        Text(
                          introItems[index].subtitle!.tr(context),
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: AppColors.nearlyWhite,
                                    fontSize: AppValues.font * 16,
                                  ),
                        ),
                      ],
                    ),
                  ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OnboardingCubit>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primary,
        appBar: const DefaultAppBar(
          addLang: true,
          addLeadingButton: false,
        ),
        body: Stack(
          children: [
            PageView(
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (value) {
                  cubit.nextOrForward(value);
                },
                controller: cubit.pageController,
                children: [
                  _pageBuilder(context, 0),
                  _pageBuilder(context, 1),
                  _pageBuilder(context, 2),
                ]),
            Positioned(
              right: 0,
              bottom: context.watch<OnboardingCubit>().index == 2
                  ? AppValues.sizeHeight * 150
                  : AppValues.sizeHeight * 50,
              left: 0,
              child: Center(
                child: SmoothPageIndicator(
                  effect: WormEffect(
                      dotHeight: AppValues.sizeHeight * 6,
                      dotWidth: AppValues.sizeWidth * 30,
                      dotColor: AppColors.secondery,
                      activeDotColor: AppColors.white),
                  controller: cubit.pageController,
                  count: introItems.length,
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: DefaultButton(
            background: AppColors.white,
            textColor: AppColors.black,
            margin: EdgeInsets.symmetric(
                horizontal: AppValues.marginWidth * 50,
                vertical: AppValues.marginHeight * 25),
            text: context.watch<OnboardingCubit>().index == 2
                ? AppStrings.getStarted
                : AppStrings.next,
            onPressed: () {
              if (cubit.index == 2) {
                cubit.setOnBoarding();
                context.navigateAndFinish(screenRoute: Routes.loginRoute);
              } else {
                cubit.pageController.nextPage(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.linear);
              }
            }),
      ),
    );
  }
}

class IntroItem {
  final String? title;
  final String? subtitle;
  final String? image;

  const IntroItem({this.title, this.subtitle, this.image});
}
