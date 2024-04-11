import 'package:car_washing/config/locale/app_localizations.dart';
import 'package:car_washing/core/components/default_components/default_button.dart';
import 'package:car_washing/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_values.dart';

class OffersCard extends StatelessWidget {
  const OffersCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: AppValues.paddingWidth * 10),
      child: Stack(
        children: [
          Image.asset(
            AppImages.offer,
            fit: BoxFit.fill,
            height: AppValues.screenHeight * 0.18,
            width: AppValues.screenWidth,
          ),
          Row(
            textDirection: TextDirection.ltr,
            children: [
              Flexible(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppValues.paddingWidth * 18,
                      vertical: AppValues.paddingHeight * 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    textDirection: TextDirection.ltr,
                    children: [
                      Text(
                        AppStrings.washyourOldCarAndMakeItNew.tr(context),
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: AppValues.font * 19.5),
                      ),
                      SizedBox(
                        height: AppValues.sizeHeight * 10,
                      ),
                      DefaultButton(
                        background: AppColors.white,
                        textColor: AppColors.primary,
                        width: AppValues.sizeWidth * 100,
                        onPressed: () {},
                        text: AppStrings.explore,
                      )
                    ],
                  ),
                ),
              ),
              const Flexible(
                child: SizedBox.shrink(),
              )
            ],
          )
        ],
      ),
    );
  }
}
