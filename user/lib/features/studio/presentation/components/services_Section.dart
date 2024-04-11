import 'package:car_washing/config/database/api/end_points.dart';
import 'package:car_washing/config/locale/app_localizations.dart';
import 'package:flutter/material.dart';
import '../../../../core/entities/studio.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_values.dart';

class ServicesSection extends StatelessWidget {
  final List<Service> services;
  const ServicesSection({super.key, required this.services});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.services.tr(context),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.w900,
                fontSize: AppValues.font * 18),
          ),
          SizedBox(
            height: AppValues.sizeHeight * 10,
          ),
          Flexible(
              child: GridView.builder(
                  itemCount: services.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: AppValues.sizeHeight * 150,
                      crossAxisCount: 3),
                  itemBuilder: (context, index) =>
                      _ServiceCard(services[index])))
        ],
      ),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final Service service;
  const _ServiceCard(this.service);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppValues.radius * 15)),
      child: Padding(
        padding: EdgeInsets.all(AppValues.radius * 10),
        child: Column(
          children: [
            Flexible(
              flex: 3,
              child: Image.network(
                EndPoints.images + service.logo,
                fit: BoxFit.fill,
              ),
            ),
            Divider(),
            Text(
              service.price,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: AppValues.font * 15),
            ),
            SizedBox(
              height: AppValues.sizeHeight * 10,
            ),
            Text(
              service.type,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: AppValues.font * 15),
            ),
          ],
        ),
      ),
    );
  }
}
