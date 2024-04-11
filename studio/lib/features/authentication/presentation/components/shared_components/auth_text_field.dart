
import 'package:car_studio/config/locale/app_localizations.dart';
import 'package:flutter/material.dart';
import '../../../../../core/components/default_components/default_form_field.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_values.dart';

class AuthTextField extends StatelessWidget {
  final String title;
  final String message;
  final TextEditingController? controller;
  final TextInputType type;
  final bool isPassword;
  final bool? isVisible;
  final Function? function;
  final String? Function(String?)? validate;
  const AuthTextField(
      {super.key,
      required this.title,
      this.controller,
      required this.type,
      required this.message,
      this.isPassword = false,
      this.function,
      this.isVisible,
      this.validate});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title.tr(context),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: AppValues.font * 16,
                fontWeight: FontWeight.w700,
                letterSpacing: AppValues.sizeWidth * 2,
              ),
        ),
        SizedBox(
          height: AppValues.sizeHeight * 10,
        ),
        DefaultTextFormField(
            hint: message,
            isPassword: isPassword ? isVisible! : false,
            validate: validate,
            suffix: isPassword
                ? isVisible!
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined
                : null,
            suffixPressed: isPassword ? () => function!() : null,
            contentPadding: EdgeInsets.symmetric(
                horizontal: AppValues.paddingWidth * 20,
                vertical: AppValues.paddingHeight * 15),
            backgroundColor: AppColors.nearlyWhite,
            controller: controller,
            type: type),
      ],
    );
  }
}
