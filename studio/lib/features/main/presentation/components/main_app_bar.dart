import 'package:car_studio/config/locale/app_localizations.dart';
import 'package:car_studio/core/utils/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_values.dart';
import '../cubit/main_cubit.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Stack(
        clipBehavior: Clip.none,
        children: [
          Text(
            [
              AppStrings.dashboard,
              AppStrings.profile
            ][context.watch<MainCubit>().page]
                .tr(context),
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontSize: AppValues.font * 35),
          ),
          Positioned(
            top: -AppValues.sizeHeight * 5,
            left: -AppValues.sizeWidth * 15,
            child: Image.asset(
              AppImages.highlight,
            ),
          )
        ],
      ),
      leading:  Image.asset(
          AppImages.appLogo,
        ),
      
      actions: [
        CircleAvatar(
          backgroundColor: AppColors.white,
          child: GestureDetector(
            onTap: () => context.navigateTo(screenRoute: Routes.calenderRoute),
            child: Image.asset(
              AppImages.calender,
            ),
          ),
        ),
        SizedBox(
          width: AppValues.sizeWidth * 10,
        ),CircleAvatar(
          backgroundColor: AppColors.white,
          child: GestureDetector(
            onTap: () => context.navigateTo(screenRoute: Routes.notificationRoute),
            child: Image.asset(
              AppImages.notification,
            ),
          ),
        ),
        SizedBox(
          width: AppValues.sizeWidth * 10,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
