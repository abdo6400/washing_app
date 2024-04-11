import 'package:car_studio/config/locale/app_localizations.dart';
import 'package:car_studio/core/components/default_components/default_error_card.dart';
import 'package:car_studio/core/components/default_components/default_loading_indicator.dart';
import 'package:car_studio/core/utils/commons.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../app/service_locator.dart';
import '../../../../config/database/api/end_points.dart';
import '../../../../core/components/default_components/default_button.dart';
import '../../../../core/components/default_components/default_rating_bar_indicator.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_values.dart';
import '../../../../core/utils/google_mpas_tools.dart';
import '../components/description_section.dart';
import '../components/services_Section.dart';
import '../cubit/profile_cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is UserLoadedState) {
          final studio = state.user.studio;
          return Column(
            children: [
              Flexible(
                flex: 4,
                fit: FlexFit.tight,
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return Image.network(
                      EndPoints.images + studio.studioImages[index],
                      fit: BoxFit.fill,
                      width: AppValues.screenWidth,
                    );
                  },
                  itemCount: studio.studioImages.length,
                  pagination: const SwiperPagination(),
                 // control: const SwiperControl(),
                ),
              ),
              Flexible(
                  flex: 8,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppValues.paddingWidth * 20),
                    child: Column(
                      children: [
                        SizedBox(
                          height: AppValues.sizeHeight * 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                studio.name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                        fontWeight: FontWeight.w900,
                                        fontSize: AppValues.font * 18),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: AppValues.sizeHeight * 10,
                        ),
                        SizedBox(
                          width: AppValues.screenWidth,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Row(
                                  children: [
                                    Text(
                                      studio.ratingsAvg.toStringAsFixed(2),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    SizedBox(
                                      width: AppValues.sizeWidth * 5,
                                    ),
                                    Expanded(
                                        child: DefaultRatingBarIndicator(
                                      rating: studio.ratingsAvg,
                                      itemCount: 5,
                                      itemPadding: EdgeInsets.symmetric(
                                          horizontal:
                                              AppValues.paddingWidth * 2),
                                      itemSize: AppValues.font * 15,
                                    ))
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    AppStrings.open.tr(context),
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.green,
                                            fontSize: AppValues.font * 15),
                                  ),
                                  Text(
                                    " : ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: AppValues.font * 15),
                                  ),
                                  RichText(
                                      text: TextSpan(
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                      AppValues.font * 15),
                                          children: [
                                        TextSpan(
                                            text: AppStrings.from.tr(context)),
                                        const TextSpan(text: " "),
                                        TextSpan(text: studio.openTime),
                                        const TextSpan(text: " "),
                                        TextSpan(
                                            text: AppStrings.to.tr(context)),
                                        const TextSpan(text: " "),
                                        TextSpan(text: studio.closeTime)
                                      ]))
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: AppValues.sizeHeight * 30,
                        ),
                        Expanded(
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    AppValues.radius * 20)),
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: AppValues.paddingWidth * 10,
                                      vertical: AppValues.paddingHeight * 20),
                                  child: Column(
                                    children: [
                                      DescriptipnSection(
                                        description: studio.description,
                                      ),
                                      const _Divider(),
                                      ServicesSection(
                                        services: studio.services,
                                      ),
                                     
                                    ],
                                  ),
                                ),
                                Positioned.directional(
                                    textDirection: Directionality.of(context),
                                    end: AppValues.sizeWidth * 10,
                                    top: -AppValues.sizeHeight * 20,
                                    child: GestureDetector(
                                      onTap: () {
                                        try {
                                          sl<GoogleMapsTools>().launchMapsUrl(
                                              studio.location[1],
                                              studio.location[0]);
                                        } catch (e) {
                                          context.showToastMsg(
                                              msg:
                                                  AppStrings.someThingWentWrong,
                                              toastState: ToastStates.error);
                                        }
                                      },
                                      child: CircleAvatar(
                                          backgroundColor: AppColors.primary,
                                          child:
                                              Image.asset(AppImages.location)),
                                    ))
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ))
            ],
          );
        } else if (state is UserErrorstate) {
          return DefaultErrorCard(
              erroMessage: state.msg,
              function: () => context.read<ProfileCubit>().getUser(),
              title: AppStrings.someThingWentWrong);
        } else {
          return const DefaultLoadingIndicator();
        }
      },
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: AppValues.sizeHeight * 20,
        ),
        Container(
          height: AppValues.sizeHeight * 5,
          width: AppValues.screenWidth,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.transparent, AppColors.primary])),
        ),
        SizedBox(
          height: AppValues.sizeHeight * 10,
        ),
      ],
    );
  }
}
