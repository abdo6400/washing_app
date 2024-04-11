import 'package:car_washing/config/database/api/end_points.dart';
import 'package:car_washing/core/components/app_components/profile_image.dart';
import 'package:car_washing/core/components/default_components/default_loaders.dart';
import 'package:car_washing/core/utils/app_strings.dart';
import 'package:car_washing/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_values.dart';
import '../components/profile_text_field.dart';

class Profilebody extends StatelessWidget {
  const Profilebody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return ListView(
          padding:
              EdgeInsets.symmetric(horizontal: AppValues.paddingWidth * 10),
          children: [
            SizedBox(
              height: AppValues.sizeHeight * 30,
            ),
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
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        state is UserLoadedState
                            ? ProfileImage(
                                imageUrl:
                                    EndPoints.images + state.user.results.logo,
                                radius: 60)
                            : CircleAvatar(
                                radius: 60,
                                backgroundColor:
                                    AppColors.grey.withOpacity(0.5),
                              ),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: CircleAvatar(
                                radius: AppValues.radius * 20,
                                child: Icon(
                                  Icons.edit,
                                  size: AppValues.font * 20,
                                )))
                      ],
                    ),
                  ),
            state is UserLoadedState
                ? Column(
                    children: [
                      SizedBox(
                        height: AppValues.sizeHeight * 50,
                      ),
                      ProfileTextField(
                        title: AppStrings.yourName,
                        message: state.user.results.name,
                      ),
                      ProfileTextField(
                        title: AppStrings.emailAddress,
                        message: state.user.results.emailAddress,
                      ),
                      ProfileTextField(
                        title: AppStrings.phone,
                        message: state.user.results.phone,
                      ),
                      SizedBox(
                        height: AppValues.sizeHeight * 10,
                      ),
                    ],
                  )
                : Column(
                    children: [
                      SizedBox(
                        height: AppValues.sizeHeight * 50,
                      ),
                      const ProfileTextField(
                        title: AppStrings.yourName,
                        message: "******",
                      ),
                      const ProfileTextField(
                        title: AppStrings.emailAddress,
                        message: "*****",
                      ),
                      const ProfileTextField(
                        title: AppStrings.phone,
                        message: "****",
                      ),
                      SizedBox(
                        height: AppValues.sizeHeight * 10,
                      ),
                    ],
                  ),
            /*  GestureDetector(
              onTap: () {},
              child: Text(
                AppStrings.resetPassword.tr(context),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: AppValues.font * 14,
                      color: AppColors.grey1,
                      fontWeight: FontWeight.w400,
                      letterSpacing: AppValues.sizeWidth * 2,
                    ),
              ),
            ),*/
          ],
        );
      },
    );
  }
}
