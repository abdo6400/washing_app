
import 'package:car_studio/config/locale/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import '../../../../../core/components/default_components/default_loading_indicator.dart';
import '../../../../../core/components/map/presentation/components/location_map_card.dart';
import '../../../../../core/components/map/presentation/cubit/map_cubit.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_values.dart';
import '../../../../../core/utils/google_mpas_tools.dart';
import '../../cubit/authentication_cubit.dart';
import 'circle_image.dart';

class LocationInformationSection extends StatelessWidget {
  const LocationInformationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleImage(),
        SizedBox(
          height: AppValues.sizeHeight * 30,
        ),
        LocationMapCard(
          title: AppStrings.locationOnMap,
          function:(value)=> context.read<AuthenticationCubit>().setLocation(value),
          height: AppValues.sizeHeight * 320,
        ),
        SizedBox(
          height: AppValues.sizeHeight * 10,
        ),
        FutureBuilder<Placemark>(
          future: GoogleMapsTools().convertPositionToAddress(
              lat: context.watch<MapCubit>().customMarkers.latitude,
              lon: context.watch<MapCubit>().customMarkers.longitude),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              Placemark? location = snapshot.data;
              return location != null
                  ? Text(
                      "${location.country.toString()},${location.locality.toString()},${location.street.toString()}",
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.center,
                    )
                  : Text(
                      AppStrings.canNotGetLocation.tr(context),
                      style: Theme.of(context).textTheme.titleMedium,
                    );
            }
            return const DefaultLoadingIndicator();
          },
        )
      ],
    );
  }
}
