import 'package:car_washing/config/database/api/end_points.dart';
import 'package:car_washing/config/locale/app_localizations.dart';
import 'package:car_washing/config/routes/app_routes.dart';
import 'package:car_washing/core/utils/app_strings.dart';
import 'package:car_washing/core/utils/commons.dart';
import 'package:car_washing/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/default_components/default_loaders.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_values.dart';
import '../cubit/studios_cubit.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppValues.paddingWidth * 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.selectService.tr(context),
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold, fontSize: AppValues.font * 21),
          ),
          SizedBox(
            height: AppValues.sizeHeight * 5,
          ),
          SizedBox(
            height: AppValues.sizeHeight * 80,
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return state is HomeDataErrorState
                    ? Center(
                        child: Text(
                          AppStrings.someThingWentWrong,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: AppColors.black),
                        ),
                      )
                    : ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: state is HomeDataLoadedState
                            ? state.services.length
                            : 6,
                        separatorBuilder: (context, index) => SizedBox(
                              width: AppValues.sizeWidth * 10,
                            ),
                        itemBuilder: (context, index) {
                          return state is HomeDataLoadedState
                              ? SizedBox(
                                  height: AppValues.sizeHeight * 80,
                                  width: AppValues.sizeWidth * 80,
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          context
                                              .read<StudiosCubit>()
                                              .getStudios(
                                                  state.services[index].id);
                                          context.navigateTo(
                                              screenRoute: Routes.studiosRoute,
                                              arg: state.services[index]);
                                        },
                                        child: CircleAvatar(
                                          backgroundColor: AppColors.white,
                                          radius: AppValues.radius * 20,
                                          child: Image.network(
                                            EndPoints.images +
                                                state.services[index].logo,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: AppValues.sizeHeight * 5,
                                      ),
                                      Text(
                                        state.services[index].type,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                                fontWeight: FontWeight.w400,
                                                fontSize: AppValues.font * 16),
                                      )
                                    ],
                                  ))
                              : ShimmerLoader(
                                  borderRadius: AppValues.radius * 28,
                                );
                        });
              },
            ),
          )
        ],
      ),
    );
  }
}
