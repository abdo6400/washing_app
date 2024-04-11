import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/components/default_components/default_internet_connection_checker.dart';
import '../../../../core/utils/app_values.dart';
import '../../../home/presentation/pages/home_screen.dart';
import '../../../profile/presentation/screens/profile_screen.dart';
import '../components/main_app_bar.dart';
import '../components/main_bottom_bar.dart';
import '../cubit/main_cubit.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(247, 247, 249, 1),
        appBar: const MainAppBar(),
        body: SafeArea(
          child: Stack(
            children: [
              CustomInternetConnectionChecker(
                child: [
                  const HomeScreen(),
                  const ProfileScreen()
                ][context.watch<MainCubit>().page],
              ),
              const Align(
                  alignment: Alignment.bottomCenter, child: MainBottomBar()),
            ],
          ),
        ),
        floatingActionButton: Padding(
          padding: EdgeInsets.only(bottom: AppValues.paddingHeight * 30),
          child: FloatingActionButton(
            onPressed: () => context.read<MainCubit>().changePage(2),
            elevation: 10,
            child: const Icon(Icons.add),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
