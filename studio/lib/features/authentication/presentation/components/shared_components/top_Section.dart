
import 'package:car_studio/config/locale/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_values.dart';

class TopSection extends StatelessWidget {
  final String title;
  final String content;
  const TopSection({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppValues.paddingWidth * 50),
      child: Column(
        children: [
          Text(
            title.tr(context),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: AppValues.font * 32,
                  fontWeight: FontWeight.w700,
                  letterSpacing: AppValues.sizeWidth * 2,
                ),
          ),
          SizedBox(height: AppValues.sizeHeight*5),
          Text(
            content.tr(context),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: AppValues.font * 16,
                  fontWeight: FontWeight.w400,
                  letterSpacing: AppValues.sizeWidth * 2,
                  color: AppColors.grey,
                ),
          ),
        ],
      ),
    );
  }
}
