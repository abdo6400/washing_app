import 'package:car_washing/config/locale/app_localizations.dart';
import 'package:car_washing/config/routes/app_routes.dart';
import 'package:car_washing/core/utils/app_colors.dart';
import 'package:car_washing/core/utils/app_images.dart';
import 'package:car_washing/core/utils/app_values.dart';
import 'package:car_washing/core/utils/commons.dart';
import 'package:car_washing/features/main/presentation/cubit/main_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/service_locator.dart';
import '../../../../config/database/api/end_points.dart';
import '../../../../config/database/cache/cache_helper.dart';
import '../../../../core/components/app_components/profile_image.dart';
import '../../../../core/components/default_components/default_loaders.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../profile/presentation/cubit/profile_cubit.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: AppValues.paddingWidth * 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: AppValues.sizeHeight * 100,
          ),
          BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              return Column(
                children: [
                  state is UserLoadingState || state is UserErrorstate
                      ? ShimmerLoader(
                          child: CircleAvatar(
                            radius: AppValues.radius * 62,
                            backgroundColor: AppColors.white,
                          ),
                        )
                      : CircleAvatar(
                          radius: AppValues.radius * 62,
                          backgroundColor: AppColors.white,
                          child: state is UserLoadedState
                              ? ProfileImage(
                                  imageUrl: EndPoints.images +
                                      state.user.results.logo,
                                  radius: 60)
                              : CircleAvatar(
                                  radius: 60,
                                  backgroundColor:
                                      AppColors.grey.withOpacity(0.5),
                                ),
                        ),
                  SizedBox(
                    height: AppValues.sizeHeight * 20,
                  ),
                  state is UserLoadedState
                      ? Text(
                          state.user.results.name,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  fontSize: AppValues.font * 25,
                                  color: AppColors.white),
                        )
                      : ShimmerLoader(
                          child: Text(
                            "******",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                    fontSize: AppValues.font * 25,
                                    color: AppColors.white),
                          ),
                        ),
                ],
              );
            },
          ),
          SizedBox(
            height: AppValues.sizeHeight * 60,
          ),
          for (MenuItem element in [
            MenuItem(
                icon: AppImages.profile,
                name: AppStrings.profile,
                route: Routes.profileRoute),
            MenuItem(icon: AppImages.cart, name: AppStrings.myCart, route: ""),
            MenuItem(
                icon: AppImages.favorite,
                name: AppStrings.favourite,
                route: Routes.favoriteRoute),
            MenuItem(
                icon: AppImages.orders, name: AppStrings.orders, route: ""),
            MenuItem(
                icon: AppImages.notification,
                name: AppStrings.notifications,
                route: Routes.notificationRoute),
            MenuItem(
                icon: AppImages.settings,
                name: AppStrings.settings,
                route: Routes.settingsRoute),
          ])
            _MenuButton(
              icon: element.icon,
              name: element.name,
              route: element.route,
            ),
          const Divider(
            thickness: 3,
            color: AppColors.white,
          ),
          SizedBox(
            height: AppValues.sizeHeight * 20,
          ),
          ListTile(
            onTap: () async {
              context.navigateAndFinish(screenRoute: Routes.loginRoute);
              await sl<CacheHelper>().clearData();
            },
            horizontalTitleGap: 0,
            leading: Image.asset(
              AppImages.logout,
              color: AppColors.white,
            ),
            title: Text(
              AppStrings.signOut.tr(context),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: AppValues.font * 20, color: AppColors.white),
            ),
          )
        ],
      ),
    );
  }
}

class MenuItem {
  final String icon;
  final String name;
  final String route;

  MenuItem({required this.icon, required this.name, required this.route});
}

class _MenuButton extends StatelessWidget {
  final String icon;
  final String name;
  final String route;
  const _MenuButton(
      {required this.icon, required this.name, required this.route});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        context.read<MainCubit>().drawerController.toggle!();
        context.navigateTo(screenRoute: route);
      },
      leading: Image.asset(
        icon,
        color: AppColors.white,
      ),
      horizontalTitleGap: 0,
      title: Text(
        name.tr(context),
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(fontSize: AppValues.font * 18, color: AppColors.white),
      ),
    );
  }
}
