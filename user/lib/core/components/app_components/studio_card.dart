import 'package:car_washing/config/database/api/end_points.dart';
import 'package:car_washing/config/locale/app_localizations.dart';
import 'package:car_washing/config/routes/app_routes.dart';
import 'package:car_washing/core/utils/app_colors.dart';
import 'package:car_washing/core/utils/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/favorite/presentation/cubit/favorite_cubit.dart';
import '../../entities/studio.dart';
import '../../utils/app_strings.dart';
import '../../utils/app_values.dart';
import '../default_components/default_loaders.dart';
import '../default_components/default_rating_bar_indicator.dart';

class StudioCard extends StatelessWidget {
  final Studio? studio;
  const StudioCard({super.key, required this.studio});

  @override
  Widget build(BuildContext context) {
    return studio != null
        ? GestureDetector(
            onTap: () => context.navigateTo(
                screenRoute: Routes.studioRoute, arg: studio),
            child: Container(
              width: AppValues.screenWidth,
              height: AppValues.sizeHeight * 120,
              padding: EdgeInsets.symmetric(
                  horizontal: AppValues.paddingWidth * 10,
                  vertical: AppValues.paddingHeight * 10),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(AppValues.radius * 15)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                      flex: 4,
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    EndPoints.images + studio!.logo)),
                            borderRadius:
                                BorderRadius.circular(AppValues.radius * 20)),
                      )),
                  SizedBox(
                    width: AppValues.sizeWidth * 2,
                  ),
                  Flexible(
                      flex: 5,
                      fit: FlexFit.tight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            studio!.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: AppValues.font * 15),
                          ),
                          SizedBox(
                            height: AppValues.sizeHeight * 8,
                          ),
                          Row(
                            children: [
                              Text(
                                studio!.ratingsAvg.toStringAsFixed(2),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              SizedBox(
                                width: AppValues.sizeWidth * 2,
                              ),
                              Expanded(
                                  child: DefaultRatingBarIndicator(
                                rating: studio!.ratingsAvg,
                                itemCount: 5,
                                itemPadding: EdgeInsets.symmetric(
                                    horizontal: AppValues.paddingWidth * 2),
                                itemSize: AppValues.font * 15,
                              ))
                            ],
                          ),
                          const Spacer(),
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
                                              fontSize: AppValues.font * 15),
                                      children: [
                                    TextSpan(text: AppStrings.from.tr(context)),
                                    const TextSpan(text: " "),
                                    TextSpan(text: studio!.openTime),
                                    const TextSpan(text: " "),
                                    TextSpan(text: AppStrings.to.tr(context)),
                                    const TextSpan(text: " "),
                                    TextSpan(text: studio!.closeTime)
                                  ]))
                            ],
                          ),
                        ],
                      )),
                  Flexible(
                    child: GestureDetector(
                      onTap: () => context
                          .read<FavoriteCubit>()
                          .editFavorite(studio!.id),
                      child: Icon(
                        context
                                .watch<FavoriteCubit>()
                                .favoriteItems
                                .contains(studio!.id)
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                        color: !context
                                .watch<FavoriteCubit>()
                                .favoriteItems
                                .contains(studio!.id)
                            ? AppColors.grey
                            : AppColors.error,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        : ShimmerLoader(
            width: AppValues.screenWidth,
            height: AppValues.sizeHeight * 120,
            borderRadius: AppValues.radius * 15,
          );
  }
}
