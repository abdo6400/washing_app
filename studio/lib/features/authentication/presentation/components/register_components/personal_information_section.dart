
import 'package:car_studio/config/locale/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_values.dart';
import '../../../../../core/utils/custom_validation.dart';
import '../../cubit/authentication_cubit.dart';
import '../../cubit/ui_cubit/authentication_ui_cubit.dart';
import '../shared_components/auth_text_field.dart';

class PersonalInformationSection extends StatelessWidget {
  const PersonalInformationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthenticationCubit>();
    return Form(
      key: cubit.registerFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: AppValues.sizeHeight * 20,
          ),
          AuthTextField(
            title: AppStrings.yourName,
            controller: cubit.name,
            type: TextInputType.name,
            validate: (value) => CustomValidationHandler.isValidName(value!).trVaildation(context),
            message: AppStrings.enterYourName,
          ),
          SizedBox(
            height: AppValues.sizeHeight * 20,
          ),
          AuthTextField(
            title: AppStrings.phone,
            controller: cubit.phone,
            validate: (value) =>
                CustomValidationHandler.isValidPhoneNumber(value!).trVaildation(context),
            type: TextInputType.phone,
            message: AppStrings.enterYourPhone,
          ),
          SizedBox(
            height: AppValues.sizeHeight * 20,
          ),
          AuthTextField(
            title: AppStrings.password,
            controller: cubit.registerpassword,
            type: TextInputType.visiblePassword,
            message: AppStrings.enterPassword,
            isPassword: true,
            isVisible: context.watch<AuthenticationUiCubit>().password,
            validate: (value) =>
                CustomValidationHandler.isValidPassword(value!).trVaildation(context),
            function: () =>
                context.read<AuthenticationUiCubit>().changePasswordVisiblity(),
          ),
          SizedBox(
            height: AppValues.sizeHeight * 20,
          ),
          AuthTextField(
            title: AppStrings.confirmPassword,
            validate: (value) => (value != null &&
                    value.compareTo(cubit.registerpassword.text) == 0)
                ? null
                : AppStrings.pleaseEnterVaildConfirmPassword.tr(context),
            type: TextInputType.visiblePassword,
            message: AppStrings.enterconfirmPassword,
            isPassword: true,
            isVisible: context.watch<AuthenticationUiCubit>().confirmPassword,
            function: () => context
                .read<AuthenticationUiCubit>()
                .changeConfirmPasswordVisiblity(),
          ),
        ],
      ),
    );
  }
}
