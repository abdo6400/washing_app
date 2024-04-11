
import 'package:car_studio/config/locale/app_localizations.dart';
import 'package:car_studio/core/utils/commons.dart';
import 'package:flutter/material.dart';

import '../../../config/routes/app_routes.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_strings.dart';
import '../../utils/app_values.dart';
import '../default_components/default_rating_bar_indicator.dart';

class StudioCard extends StatelessWidget {
  const StudioCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.navigateTo(screenRoute: Routes.studioRoute),
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
                      image: const DecorationImage(
                          image: NetworkImage(
                              "https://img.freepik.com/free-photo/yellow-car-gas-station_23-2150697544.jpg?w=826&t=st=1703232927~exp=1703233527~hmac=b8096b5c8087d5eb108cc060d33aba1b4864c5810d8dee5dd53ab914bd823fd9")),
                      borderRadius: BorderRadius.circular(AppValues.radius * 20)),
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
                      AppStrings.popularCarwashStudio.tr(context),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: AppValues.font * 15),
                    ),
                    SizedBox(
                      height: AppValues.sizeHeight * 8,
                    ),
                    Row(
                      children: [
                        Text(
                          "4.5",
                          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        SizedBox(
                          width: AppValues.sizeWidth * 2,
                        ),
                        Expanded(
                            child: DefaultRatingBarIndicator(
                          rating: 4.5,
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
                        Text(
                          "09 AM TO 11 PM",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: AppValues.font * 15),
                        ),
                      ],
                    ),
                  ],
                )),
            const Flexible(
                child: Icon(
              Icons.favorite,
              color: AppColors.error,
            ))
          ],
        ),
      ),
    );
  }
}
