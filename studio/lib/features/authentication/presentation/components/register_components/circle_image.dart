import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_values.dart';
import '../../cubit/authentication_cubit.dart';

class CircleImage extends StatelessWidget {
  const CircleImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        context.watch<AuthenticationCubit>().logo == null
            ? GestureDetector(
                onTap: () {
                  context.read<AuthenticationCubit>().pikeImage(context);
                },
                child: CircleAvatar(
                  radius: AppValues.radius * 50,
                  backgroundColor: AppColors.lightGrey2,
                ),
              )
            : CircleAvatar(
                backgroundColor: AppColors.lightGrey,
                radius: AppValues.radius * 70,
                backgroundImage: FileImage(
                    File(context.read<AuthenticationCubit>().logo!.path)),
              ),
        Positioned(
          bottom: AppValues.sizeHeight * 10,
          right: 0,
          child: GestureDetector(
            onTap: () => context.read<AuthenticationCubit>().pikeImage(context),
            child: CircleAvatar(
                radius: AppValues.radius * 15,
                backgroundColor: AppColors.blueLight,
                child: Icon(
                  Icons.edit_outlined,
                  color: AppColors.white,
                  size: AppValues.font * 15,
                )),
          ),
        )
      ],
    );
  }
}
