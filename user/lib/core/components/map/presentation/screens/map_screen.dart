import 'package:car_washing/config/locale/app_localizations.dart';
import 'package:car_washing/core/components/default_components/default_loading_indicator.dart';
import 'package:car_washing/core/components/map/presentation/cubit/map_cubit.dart';
import 'package:car_washing/core/utils/app_enums.dart';
import 'package:car_washing/core/utils/app_strings.dart';
import 'package:car_washing/core/utils/commons.dart';
import 'package:car_washing/core/utils/google_mpas_tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/app_values.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final function = ModalRoute.of(context)?.settings.arguments as Function;
    return SafeArea(
      child: BlocListener<MapCubit, MapState>(
        listener: (context, state) {
          if (state is MapGetMyLocationLoadingState) {
            context.showLoader();
          } else if (state is MapGetMyLocationErrorState) {
            context.hideLoader();
            context.showToastMsg(
                msg: AppStrings.canNotGetLocation,
                toastState: ToastStates.error);
          } else if (state is MapGetMyLocationLoadedState) {
            context.hideLoader();
          }
        },
        child: Scaffold(
          body: Stack(
            children: [
              FlutterMap(
                mapController: context.read<MapCubit>().mapController,
                options: MapOptions(
                  initialCenter: context.watch<MapCubit>().customMarkers,
                  initialZoom: context.watch<MapCubit>().zoom,
                  onTap: (_, p) => context.read<MapCubit>().changeLocation(p),
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
              ),
              Positioned(
                top: AppValues.sizeHeight * 10,
                right: AppValues.sizeWidth * 10,
                left: AppValues.sizeWidth * 10,
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () => Navigator.of(context).pop(true),
                        child: Icon(
                          Icons.arrow_back,
                          size: AppValues.font * 30,
                        )),
                    SizedBox(
                      width: AppValues.sizeWidth * 20,
                    ),
                    Expanded(
                        child: SearchBar(
                      controller: context.read<MapCubit>().searchController,
                      hintText: AppStrings.search.tr(context),
                      trailing: [
                        GestureDetector(
                            onTap: () {},
                            child: Icon(
                              Icons.search,
                              size: AppValues.font * 30,
                            )),
                      ],
                    )),
                    SizedBox(
                      width: AppValues.sizeWidth * 20,
                    ),
                    GestureDetector(
                        onTap: () => context.read<MapCubit>().getMyLocation(),
                        child: Icon(
                          Icons.my_location_outlined,
                          size: AppValues.font * 30,
                        )),
                  ],
                ),
              ),
              Positioned(
                  bottom: AppValues.sizeHeight * 10,
                  right: AppValues.sizeWidth * 10,
                  left: AppValues.sizeWidth * 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Card(
                            child: GestureDetector(
                                onTap: () => context.read<MapCubit>().zoomIn(),
                                child: Padding(
                                  padding: EdgeInsets.all(AppValues.radius * 5),
                                  child: Icon(
                                    Icons.add,
                                    size: AppValues.font * 30,
                                  ),
                                )),
                          ),
                          SizedBox(
                            width: AppValues.sizeWidth * 20,
                          ),
                          GestureDetector(
                              onTap: () => context.read<MapCubit>().zoomOut(),
                              child: Card(
                                child: Padding(
                                  padding: EdgeInsets.all(AppValues.radius * 5),
                                  child: Icon(
                                    Icons.horizontal_rule,
                                    size: AppValues.font * 30,
                                  ),
                                ),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: AppValues.sizeHeight * 10,
                      ),
                      BottomAppBar(
                        child: Row(
                          children: [
                            Expanded(
                                child: FutureBuilder<Placemark>(
                              future: GoogleMapsTools()
                                  .convertPositionToAddress(
                                      lat: context
                                          .watch<MapCubit>()
                                          .customMarkers
                                          .latitude,
                                      lon: context
                                          .watch<MapCubit>()
                                          .customMarkers
                                          .longitude),
                              builder: (BuildContext context,
                                  AsyncSnapshot<dynamic> snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  Placemark? location = snapshot.data;
                                  return location != null
                                      ? Text(
                                          "${location.country.toString()},${location.locality.toString()},${location.street.toString()}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        )
                                      : Text(
                                          AppStrings.canNotGetLocation
                                              .tr(context),
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        );
                                }
                                return const DefaultLoadingIndicator();
                              },
                            )),
                            GestureDetector(
                                onTap: () {
                                  function(
                                      context.read<MapCubit>().customMarkers);
                                  Navigator.of(context).pop(true);
                                },
                                child: const Icon(Icons.send))
                          ],
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
