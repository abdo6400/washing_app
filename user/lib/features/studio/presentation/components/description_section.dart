import 'package:car_washing/config/locale/app_localizations.dart';
import 'package:car_washing/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_values.dart';

class DescriptipnSection extends StatelessWidget {
  final String description;
  const DescriptipnSection({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.description.tr(context),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: AppColors.black,
              fontWeight: FontWeight.w900,
              fontSize: AppValues.font * 18),
        ),
        SizedBox(height: AppValues.sizeHeight*10,),
        Text(
         description ,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: AppColors.grey,
              fontWeight: FontWeight.w900,
              fontSize: AppValues.font * 16),
        ),
      ],
    );
  }
}
