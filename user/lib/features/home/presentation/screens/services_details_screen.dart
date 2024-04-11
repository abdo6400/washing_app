import 'package:car_washing/features/home/presentation/cubit/studios_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/components/app_components/studio_card.dart';
import '../../../../core/components/custom_components/message_card.dart';
import '../../../../core/components/default_components/default_appbar.dart';
import '../../../../core/components/default_components/default_error_card.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_values.dart';
import '../../domain/entities/category.dart';

class ServiceDetailsScreen extends StatelessWidget {
  const ServiceDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final service = ModalRoute.of(context)?.settings.arguments as Category;
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color.fromRGBO(247, 247, 249, 1),
          appBar: DefaultAppBar(
              addLang: false, appBarText: service.type, addLeadingButton: true),
          body: BlocBuilder<StudiosCubit, StudiosState>(
              builder: (context, state) {
            if (state is ServicesLoadedState && state.studios.isEmpty) {
              return const MessageCard(
                sign: '!',
                title: AppStrings.noStudiosInthisServices,
                subTitle: AppStrings.yourFavoritePageEmptyMessage,
              );
            }

            return state is ServicesErrorState
                ? DefaultErrorCard(
                    erroMessage: state.msg,
                    function: () =>
                        context.read<StudiosCubit>().getStudios(service.id),
                    title: AppStrings.someThingWentWrong,
                  )
                : ListView.separated(
                    padding: EdgeInsets.only(
                        top: AppValues.sizeHeight * 20,
                        bottom: AppValues.sizeHeight * 10,
                        right: AppValues.sizeWidth * 20,
                        left: AppValues.sizeWidth * 20),
                    itemBuilder: (context, index) => StudioCard(
                          studio: state is ServicesLoadedState
                              ? state.studios[index]
                              : null,
                        ),
                    separatorBuilder: (context, index) => SizedBox(
                          height: AppValues.sizeHeight * 20,
                        ),
                    itemCount: state is ServicesLoadedState
                        ? state.studios.length
                        : 6);
          })),
    );
  }
}
