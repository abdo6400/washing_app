import 'package:car_washing/core/components/default_components/default_error_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/components/app_components/studio_card.dart';
import '../../../../core/components/custom_components/message_card.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_values.dart';
import '../cubit/favorite_cubit.dart';

class Favoritebody extends StatelessWidget {
  const Favoritebody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(builder: (context, state) {
      if (state is FavoriteDataLoadedState && state.studios.isEmpty) {
        return const MessageCard(
          sign: '+',
          title: AppStrings.yourFavoritePageEmpty,
          subTitle: AppStrings.yourFavoritePageEmptyMessage,
        );
      }
      return state is FavoriteDataErrorState
          ? DefaultErrorCard(
              erroMessage: state.msg,
              function: () => {},
              title: AppStrings.someThingWentWrong,
            )
          : ListView.separated(
              padding: EdgeInsets.only(
                  right: AppValues.sizeWidth * 20,
                  left: AppValues.sizeWidth * 20,
                  top: AppValues.sizeHeight * 10),
              itemBuilder: (context, index) => StudioCard(
                    studio: state is FavoriteDataLoadedState
                        ? state.studios[index]
                        : null,
                  ),
              separatorBuilder: (context, index) => SizedBox(
                    height: AppValues.sizeHeight * 20,
                  ),
              itemCount:
                  state is FavoriteDataLoadedState ? state.studios.length : 6);
    });
  }
}
