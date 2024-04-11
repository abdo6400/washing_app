import 'package:car_washing/config/locale/app_localizations.dart';
import 'package:car_washing/config/routes/app_routes.dart';
import 'package:car_washing/core/utils/app_colors.dart';
import 'package:car_washing/core/utils/app_strings.dart';
import 'package:car_washing/core/utils/app_values.dart';
import 'package:car_washing/core/utils/commons.dart';
import 'package:car_washing/features/main/presentation/cubit/main_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_images.dart';

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
              AppStrings.explore,
              AppStrings.favourite,
              AppStrings.map,
              AppStrings.notifications,
              AppStrings.profile
            ][context.watch<MainCubit>().page]
                .tr(context),
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontSize: AppValues.font * 35),
          ),
          Positioned(
            top: -AppValues.sizeHeight * 10,
            left: -AppValues.sizeWidth * 15,
            child: Image.asset(
              AppImages.highlight,
            ),
          )
        ],
      ),
      leading: GestureDetector(
        onTap: () => context.read<MainCubit>().drawerController.toggle!(),
        child: Image.asset(
          AppImages.menu,
        ),
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
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
