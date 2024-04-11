import 'package:car_washing/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/components/default_components/default_internet_connection_checker.dart';
import '../../../../core/utils/app_values.dart';
import '../../../favorite/presentation/components/favorite_body.dart';
import '../../../home/presentation/screens/home_screen.dart';
import '../../../locations/presentation/screens/locations_screen.dart';
import '../../../notification/presentation/components/notification_body.dart';
import '../../../profile/presentation/components/profile_body.dart';
import '../components/main_app_bar.dart';
import '../components/main_bottom_bar.dart';
import '../cubit/main_cubit.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(247, 247, 249, 1),
      appBar: const MainAppBar(),
      body: Stack(
        children: [
          CustomInternetConnectionChecker(
            child: [
              const HomeScreen(),
              const Favoritebody(),
              const LocationsScreen(),
              const Notificationbody(),
              const Profilebody()
            ][context.watch<MainCubit>().page],
          ),
          const Align(
              alignment: Alignment.bottomCenter, child: MainBottomBar()),
        ],
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: AppValues.paddingHeight * 30),
        child: FloatingActionButton(
          onPressed: () => context.read<MainCubit>().changePage(2),
          elevation: 10,
          child: Image.asset(
            AppImages.location,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
