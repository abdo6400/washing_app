import 'package:car_washing/config/locale/app_localizations.dart';
import 'package:car_washing/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/app_components/studio_card.dart';
import '../../../../core/components/default_components/default_error_card.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_values.dart';

class PopularStudiosSection extends StatelessWidget {
  const PopularStudiosSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppValues.paddingWidth * 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.popularCarwashStudio.tr(context),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold, fontSize: AppValues.font * 21),
            ),
            SizedBox(
              height: AppValues.sizeHeight * 15,
            ),
            Expanded(child:
                BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
              return state is HomeDataErrorState
                  ? DefaultErrorCard(
                      erroMessage: state.msg,
                      function: () => context.read<HomeCubit>().getHomeData(),
                      title: AppStrings.someThingWentWrong,
                    )
                  : ListView.separated(
                      padding:
                          EdgeInsets.only(bottom: AppValues.sizeHeight * 50),
                      itemBuilder: (context, index) => StudioCard(
                            studio: state is HomeDataLoadedState
                                ? state.studios[index]
                                : null,
                          ),
                      separatorBuilder: (context, index) => SizedBox(
                            height: AppValues.sizeHeight * 20,
                          ),
                      itemCount: state is HomeDataLoadedState
                          ? state.studios.length
                          : 6);
            }))
          ],
        ),
      ),
    );
  }
}
