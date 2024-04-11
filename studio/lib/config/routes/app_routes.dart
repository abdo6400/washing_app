import 'package:car_studio/features/main/presentation/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../../core/components/map/presentation/screens/map_screen.dart';
import '../../core/utils/app_strings.dart';
import '../../features/authentication/presentation/screens/forget_password/forget_screen.dart';
import '../../features/authentication/presentation/screens/forget_password/otp_screen.dart';
import '../../features/authentication/presentation/screens/forget_password/reset_password_screen.dart';
import '../../features/authentication/presentation/screens/login/login_screen.dart';
import '../../features/authentication/presentation/screens/register/information_screen.dart';
import '../../features/authentication/presentation/screens/register/otp_register_screen.dart';
import '../../features/authentication/presentation/screens/register/register_screen.dart';
import '../../features/start/screens/onboarding_screen.dart';
import '../../features/start/screens/splash_screen.dart';

class Routes {
  //basic routes
  static const String initialRoute = '/';
  static const String mapRoute = '/mapRoute';
  static const String onBoardingRoute = "/onBoardingRoute";
  static const String loginRoute = "/loginRoute";
  static const String mainRoute = "/homeRoute";
  static const String forgetPasswordRoute = "/forgetPasswordRoute";
  static const String resetPasswordRoute = "/resetPasswordRoute";
  static const String otpRoute = "/otpRoute";
  static const String otpRegisterRoute = "/otpRegisterRoute";
  static const String registerRoute = "/registerRoute";
  //app routes
  static const String informationRoute = "/informationRoute";
  static const String calenderRoute = "/calenderRoute";
  static const String studioRoute = "/studioRoute";
  static const String notificationRoute = "/notificationRoute";
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return PageTransition(
            child: const SplashScreen(),
            type: PageTransitionType.fade,
            settings: routeSettings);
      case Routes.onBoardingRoute:
        return PageTransition(
            child: const OnBoardingScreen(),
            type: PageTransitionType.fade,
            settings: routeSettings);
      case Routes.mapRoute:
        return PageTransition(
            child: const MapScreen(),
            type: PageTransitionType.topToBottom,
            settings: routeSettings);
      case Routes.mainRoute:
        return PageTransition(
            child: const MainScreen(),
            type: PageTransitionType.topToBottom,
            settings: routeSettings);
      case Routes.loginRoute:
        return PageTransition(
            child: const LoginScreen(),
            type: PageTransitionType.leftToRightWithFade,
            settings: routeSettings);
      case Routes.forgetPasswordRoute:
        return PageTransition(
            child: const ForgetPasswordScreen(),
            type: PageTransitionType.leftToRightWithFade,
            settings: routeSettings);
      case Routes.resetPasswordRoute:
        return PageTransition(
            child: const ResetPasswordScreen(),
            type: PageTransitionType.leftToRightWithFade,
            settings: routeSettings);
      case Routes.otpRoute:
        return PageTransition(
            child: const OtpScreen(),
            type: PageTransitionType.leftToRightWithFade,
            settings: routeSettings);
      case Routes.otpRegisterRoute:
        return PageTransition(
            child: const OtpRegisterScreen(),
            type: PageTransitionType.leftToRightWithFade,
            settings: routeSettings);
      case Routes.informationRoute:
        return PageTransition(
            child: const InformationScreen(),
            type: PageTransitionType.leftToRightWithFade,
            settings: routeSettings);
      case Routes.registerRoute:
        return PageTransition(
            child: const RegisterScreen(),
            type: PageTransitionType.leftToRightWithFade,
            settings: routeSettings);
      /*case Routes.calenderRoute:
        return PageTransition(
            child: const CalenderScreen(),
            type: PageTransitionType.leftToRightWithFade,
            settings: routeSettings);
      case Routes.studioRoute:
        return PageTransition(
            child: const StudioScreen(),
            type: PageTransitionType.leftToRightWithFade,
            settings: routeSettings);*/
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: ((context) => const Scaffold(
              body: Center(
                child: Text(AppStrings.noRouteFound),
              ),
            )));
  }
}
