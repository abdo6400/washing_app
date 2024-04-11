import 'package:car_washing/core/utils/app_colors.dart';
import 'package:car_washing/core/utils/app_values.dart';
import 'package:car_washing/features/main/presentation/cubit/main_cubit.dart';
import 'package:car_washing/features/main/presentation/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'home_drawer.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
          statusBarColor: Color.fromRGBO(247, 247, 249, 1),
          statusBarIconBrightness: Brightness.dark),
      child: SafeArea(
        child: ZoomDrawer(
          controller: context.read<MainCubit>().drawerController,
          borderRadius: AppValues.radius * 50,
          openCurve: Curves.fastOutSlowIn,
          slideWidth: MediaQuery.of(context).size.width * 0.6,
          duration: const Duration(milliseconds: 500),
          angle: -5,
          menuBackgroundColor: AppColors.primary,
          mainScreen: const MainScreen(),
          moveMenuScreen: true,
          menuScreen: const HomeDrawer(),
        ),
      ),
    );
  }
}
