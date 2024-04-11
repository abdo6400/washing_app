import 'package:car_washing/config/locale/app_localizations.dart';
import 'package:car_washing/core/utils/app_values.dart';
import 'package:car_washing/features/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_colors.dart';

class BottomSection extends StatelessWidget {
  final String firstTitle;
  final String secondTitle;
  final Function function;
  const BottomSection(
      {super.key,
      required this.firstTitle,
      required this.secondTitle,
      required this.function});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(firstTitle.tr(context),
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: AppColors.grey1,
                fontSize: AppValues.font * 16,
                fontWeight: FontWeight.bold)),
        TextButton(
          onPressed: () {
          context.read<AuthenticationCubit>().clearAllValues();
            function();
            },
          child: Text(secondTitle.tr(context),
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  fontSize: AppValues.font * 16, fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}
