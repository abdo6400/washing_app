import 'package:car_washing/config/locale/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_values.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppValues.screenWidth,
      height: AppValues.sizeHeight * 100,
      padding: EdgeInsets.symmetric(
          horizontal: AppValues.paddingWidth * 5,
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
            width: AppValues.sizeWidth * 10,
          ),
          Flexible(
              flex: 6,
              fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "We Have New Services With Offers",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: AppValues.font * 15),
                  ),
                  SizedBox(
                    height: AppValues.sizeHeight * 8,
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "64.95 \$",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.black,
                                fontSize: AppValues.font * 15),
                      ),
                      Text(
                        "64.95 \$",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.grey,
                                decoration: TextDecoration.lineThrough,
                                fontSize: AppValues.font * 15),
                      ),
                    ],
                  ),
                ],
              )),
          Flexible(
            flex: 3,
            child: Text(
              "7 ${AppStrings.minAgo.tr(context)}",
              maxLines: 1,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.grey,
                  fontSize: AppValues.font * 12),
            ),
          )
        ],
      ),
    );
  }
}
