import 'package:car_washing/core/components/app_components/custom_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_values.dart';

class LocationsScreen extends StatelessWidget {
  const LocationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FlutterMap(
          //mapController: context.read<MapCubit>().mapController,
          options: MapOptions(
            // initialCenter: context.watch<MapCubit>().customMarkers,
            //   initialZoom: context.watch<MapCubit>().zoom,
            //    onTap: (_, p) => context.read<MapCubit>().changeLocation(p),
            interactionOptions: const InteractionOptions(
              flags: ~InteractiveFlag.doubleTapZoom,
            ),
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'dev.fleaflet.flutter_map.example',
            ),
            MarkerLayer(
              markers: [
                Marker(
                  // point: context.watch<MapCubit>().customMarkers,
                  child: Image.asset(
                    AppImages.car1,
                    fit: BoxFit.fill,
                  ),
                  width: AppValues.sizeWidth * 40,
                  alignment: Alignment.center,
                  height: AppValues.sizeHeight * 40, point: LatLng(1.5, 1),
                )
              ],
              rotate: false,
              alignment: Alignment.center,
            ),
          ],
        ),
        Positioned(
            top: AppValues.sizeHeight * 10,
            right: AppValues.sizeWidth * 10,
            left: AppValues.sizeWidth * 10,
            child: CustomSearchBar(function: () {})),
      ],
    );
  }
}
