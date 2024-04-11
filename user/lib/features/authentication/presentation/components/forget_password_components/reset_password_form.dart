import 'package:car_washing/config/locale/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/components/default_components/default_button.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_values.dart';
import '../../../../../core/utils/custom_validation.dart';
import '../../cubit/authentication_cubit.dart';
import '../../cubit/ui_cubit/authentication_ui_cubit.dart';
import '../shared_components/auth_text_field.dart';

class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthenticationCubit>();
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppValues.marginWidth * 20),
      child: Form(
        key: cubit.resetPasswordFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: AppValues.sizeHeight * 30,
            ),
            AuthTextField(
              title: AppStrings.password,
              controller: cubit.newPassword,
              type: TextInputType.visiblePassword,
              message: AppStrings.enterPassword,
              isPassword: true,
              validate: (value) =>
                  CustomValidationHandler.isValidPassword(value!)
                      .trVaildation(context),
              isVisible: context.watch<AuthenticationUiCubit>().password,
              function: () => context
                  .read<AuthenticationUiCubit>()
                  .changePasswordVisiblity(),
            ),
            SizedBox(
              height: AppValues.sizeHeight * 20,
            ),
            AuthTextField(
              title: AppStrings.confirmPassword,
              controller: cubit.confirmNewPassword,
              type: TextInputType.visiblePassword,
              message: AppStrings.enterconfirmPassword,
              validate: (value) => (value != null &&
                      value.compareTo(cubit.newPassword.text) == 0)
                  ? null
                  : AppStrings.pleaseEnterVaildConfirmPassword.tr(context),
              isPassword: true,
              isVisible: context.watch<AuthenticationUiCubit>().confirmPassword,
              function: () => context
                  .read<AuthenticationUiCubit>()
                  .changeConfirmPasswordVisiblity(),
            ),
            SizedBox(
              height: AppValues.sizeHeight * 30,
            ),
            DefaultButton(
                elevation: 0,
                text: AppStrings.confirm,
                onPressed: () => cubit.resetPassword()),
          ],
        ),
      ),
    );
  }
}
