import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_fonts.dart';
import '../../core/utils/app_styles.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // main colors
    scaffoldBackgroundColor: Colors.white,
    primaryColor: AppColors.primary,
    useMaterial3: false,
    // primaryColorLight: AppColors.primary,
    // primaryColorDark: AppColors.darkPrimary,
    // disabledColor => button when is not clickables
    disabledColor: AppColors.grey1,
    splashColor: AppColors.lightPrimary, // ripple effect color
    // cardview theme
    cardTheme: const CardTheme(
      color: AppColors.white,
      shadowColor: AppColors.grey,
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        elevation: 10, backgroundColor: AppColors.primary),
    tabBarTheme: TabBarTheme(
        labelPadding: EdgeInsets.symmetric(horizontal: AppFonts.s30.w),
        indicator: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColors.primary,
              width: 3.0.w,
            ),
          ),
        ),
        indicatorColor: AppColors.primary,
        labelColor: AppColors.primary,
        unselectedLabelColor: AppColors.lightGrey),
    bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(type: BottomNavigationBarType.fixed),
    // app bar theme
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      // centerTitle: true,
      // color: AppColors.primary,

      shadowColor: AppColors.lightPrimary,
      titleTextStyle: getBoldStyle(
        fontSize: AppFonts.s16,
        color: AppColors.black,
      ),
    ),
    // button theme
    buttonTheme: const ButtonThemeData(
        shape: StadiumBorder(),
        disabledColor: AppColors.grey1,
        buttonColor: AppColors.primary,
        splashColor: AppColors.lightPrimary),

    // elevated button them
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getBoldStyle(
          fontSize: AppFonts.s16.sp,
          color: AppColors.white,
        ),
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(),
      ),
    ),

    //* text theme
    textTheme: TextTheme(
      //titles like welcome
      displayLarge: getBoldStyle(
        fontSize: AppFonts.s20,
        color: AppColors.white,
      ),
      displayMedium: getRegularStyle(
        fontSize: AppFonts.s16,
        color: AppColors.white,
      ),
      headlineLarge: getBoldStyle(
        fontSize: AppFonts.s16,
        color: AppColors.white,
      ),
      headlineMedium: getRegularStyle(
        color: AppColors.grey,
        fontSize: AppFonts.s16,
      ),
      /*
      titleMedium: getMediumStyle(
        color: AppColors.primary,
        fontSize: AppFonts.s16,
      ),
      titleSmall: getRegularStyle(
        color: AppColors.white,
        fontSize: AppFonts.s16,
      ),
      bodyLarge: getRegularStyle(
        color: AppColors.grey1,
      ),
      bodySmall: getRegularStyle(
        color: AppColors.grey,
      ),
      bodyMedium: getRegularStyle(
        color: AppColors.grey2,
        fontSize: AppFonts.s12,
      ),
      labelSmall: getBoldStyle(
        color: AppColors.primary,
        fontSize: AppFonts.s12,
      ),
      labelMedium: getRegularStyle(
        color: AppColors.grey1,
      ),*/
    ),

    // label style
  );
}

ThemeData getApplicationDarkTheme() {
  return ThemeData(
    // main colors
    primaryColor: AppColors.darkGrey,
    // primaryColorLight: AppColors.primary,
    // primaryColorDark: AppColors.darkPrimary,
    // disabledColor => button when is not clickables
    disabledColor: AppColors.grey1,
    splashColor: AppColors.lightPrimary, // ripple effect color

    // cardview theme

    //* text theme
    textTheme: TextTheme(
      displayLarge: getSemiBoldStyle(
        color: AppColors.black,
        fontSize: AppFonts.s22,
      ),
      headlineLarge: getSemiBoldStyle(
        color: AppColors.darkGrey,
        fontSize: AppFonts.s16,
      ),
      headlineMedium: getRegularStyle(
        color: AppColors.darkGrey,
        fontSize: AppFonts.s14,
      ),
      titleMedium: getMediumStyle(
        color: AppColors.primary,
        fontSize: AppFonts.s16,
      ),
      titleSmall: getRegularStyle(
        color: AppColors.white,
        fontSize: AppFonts.s16,
      ),
      bodyLarge: getRegularStyle(
        color: AppColors.grey1,
      ),
      bodySmall: getRegularStyle(
        color: AppColors.grey,
      ),
      bodyMedium: getRegularStyle(
        color: AppColors.greyMedi,
        fontSize: AppFonts.s12,
      ),
      labelSmall: getBoldStyle(
        color: AppColors.primary,
        fontSize: AppFonts.s12,
      ),
    ),

    // label style
  );
}
