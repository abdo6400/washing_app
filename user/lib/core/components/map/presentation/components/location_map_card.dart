import 'package:car_washing/config/locale/app_localizations.dart';
import 'package:car_washing/config/routes/app_routes.dart';
import 'package:car_washing/core/utils/app_images.dart';
import 'package:car_washing/core/utils/app_values.dart';
import 'package:car_washing/core/utils/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import '../../../../utils/app_colors.dart';
import '../cubit/map_cubit.dart';

class LocationMapCard extends StatefulWidget {
  final String title;
  final double height;
  final Function function;
  const LocationMapCard(
      {super.key,
      required this.title,
      required this.height,
      required this.function});

  @override
  State<LocationMapCard> createState() => _LocationMapCardState();
}

class _LocationMapCardState extends State<LocationMapCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: Stack(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(AppValues.radius * 20),
              child: FlutterMap(
                mapController: context.read<MapCubit>().subMapController,
                options: MapOptions(
                  initialCenter: context.watch<MapCubit>().customMarkers,
                  initialZoom: 10,
                  interactionOptions: const InteractionOptions(
                    flags: ~InteractiveFlag.doubleTapZoom,
                  ),
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: context.watch<MapCubit>().customMarkers,
                        child: Image.asset(
                          AppImages.car1,
                          fit: BoxFit.fill,
                        ),
                        width: AppValues.sizeWidth * 40,
                        alignment: Alignment.center,
                        height: AppValues.sizeHeight * 40,
                      )
                    ],
                    rotate: false,
                    alignment: Alignment.center,
                  ),
                ],
              )),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: GestureDetector(
              onTap: () => context.navigateTo(
                  screenRoute: Routes.mapRoute, arg: widget.function),
              child: Container(
                height: AppValues.sizeHeight * 50,
                alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(
                    backgroundBlendMode: BlendMode.overlay,
                    color: AppColors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(AppValues.radius * 20)),
                child: Text(
                  widget.title.tr(context),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: AppColors.blueDarK),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
