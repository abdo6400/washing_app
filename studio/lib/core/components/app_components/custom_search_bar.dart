
import 'package:car_studio/config/locale/app_localizations.dart';
import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_strings.dart';
import '../../utils/app_values.dart';

class CustomSearchBar extends StatelessWidget {
  final Function function;
  const CustomSearchBar({super.key, required this.function});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppValues.paddingWidth * 30,
          vertical: AppValues.paddingHeight * 20),
      child: Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppValues.radius * 30)),
        child: ListTile(
          leading: const Icon(Icons.search_outlined),
          onTap: () => function(),
          horizontalTitleGap: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppValues.radius * 30)),
          contentPadding:
              EdgeInsets.symmetric(horizontal: AppValues.paddingWidth * 30),
          minVerticalPadding: 0,
          title: Text(
            AppStrings.lookingForCarwashStudio.tr(context),
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: AppColors.grey),
          ),
        ),
      ),
    );
  }
}


/** CircleAvatar(
            radius: AppValues.radius * 30,
            child: Image.asset(
              AppImages.sliders,
              fit: BoxFit.cover,
            ),
          ) */