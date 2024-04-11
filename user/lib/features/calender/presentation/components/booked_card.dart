import 'package:car_washing/core/utils/app_colors.dart';
import 'package:car_washing/core/utils/app_values.dart';
import 'package:flutter/material.dart';

class BookedCard extends StatelessWidget {
  const BookedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: AppValues.marginWidth * 15,
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppValues.radius * 15)),
      child: ListTile(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppValues.radius * 15)),
          leading: Card(
            elevation: 0.5,
            margin: EdgeInsets.zero,
            color: AppColors.primary,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppValues.paddingWidth * 20,
                  vertical: AppValues.paddingHeight * 10),
              child: Text(
                "1",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: AppColors.white),
              ),
            ),
          ),
          title: Text(
            "Ama studio",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: AppColors.black),
          ),
          subtitle: Text(
            "09:00Am",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: AppColors.grey),
          ),
          trailing: Icon(
            Icons.delete_outline,
            color: AppColors.error,
          )),
    );
  }
}
