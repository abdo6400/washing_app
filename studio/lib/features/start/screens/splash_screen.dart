import 'dart:async';

import 'package:car_studio/core/utils/commons.dart';
import 'package:flutter/material.dart';
import '../../../../app/service_locator.dart';
import '../../../../config/database/cache/cache_helper.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_images.dart';
import '../../../core/utils/app_values.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _goNext() async {
    (sl<CacheHelper>().getDataString(key: MySharedKeys.apiToken.name) != null)
        ? context.navigateAndFinish(screenRoute: Routes.mainRoute)
        : (sl<CacheHelper>().getDataString(key: MySharedKeys.onBoarding.name) !=
                null)
            ? context.navigateAndFinish(screenRoute: Routes.loginRoute)
            : context.navigateAndFinish(screenRoute: Routes.onBoardingRoute);
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 3000), () => _goNext());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Image.asset(
        AppImages.appLogo,
        height: AppValues.sizeHeight * 200,
        width: AppValues.sizeWidth * 200,
      ),
    ));
  }
}
