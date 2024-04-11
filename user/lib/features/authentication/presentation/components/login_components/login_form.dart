import 'package:car_washing/config/locale/app_localizations.dart';
import 'package:car_washing/core/utils/commons.dart';
import 'package:car_washing/core/utils/custom_validation.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../config/routes/app_routes.dart';
import '../../../../../core/components/default_components/default_button.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_values.dart';
import '../../cubit/authentication_cubit.dart';
import '../../cubit/ui_cubit/authentication_ui_cubit.dart';
import '../shared_components/auth_text_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthenticationCubit>();
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppValues.marginWidth * 20),
      child: Form(
        key: cubit.loginFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: AppValues.sizeHeight * 20,
            ),
            AuthTextField(
              title: AppStrings.emailAddress,
              controller: cubit.email,
              validate: (value) => CustomValidationHandler.isValidEmail(value!)
                  .trVaildation(context),
              type: TextInputType.emailAddress,
              message: AppStrings.enterEmail,
            ),
            SizedBox(
              height: AppValues.sizeHeight * 20,
            ),
            AuthTextField(
              title: AppStrings.password,
              controller: cubit.password,
              type: TextInputType.visiblePassword,
              message: AppStrings.enterPassword,
              validate: (value) =>
                  CustomValidationHandler.isValidPassword(value!)
                      .trVaildation(context),
              isPassword: true,
              isVisible: context.watch<AuthenticationUiCubit>().password,
              function: () => context
                  .read<AuthenticationUiCubit>()
                  .changePasswordVisiblity(),
            ),
            SizedBox(
              height: AppValues.sizeHeight * 10,
            ),
            GestureDetector(
              onTap: () {
                cubit.clearAllValues();
                context.navigateTo(screenRoute: Routes.forgetPasswordRoute);
              },
              child: Text(
                AppStrings.recoveryPassword.tr(context),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: AppValues.font * 14,
                      color: AppColors.grey1,
                      fontWeight: FontWeight.w400,
                      letterSpacing: AppValues.sizeWidth * 2,
                    ),
              ),
            ),
            SizedBox(
              height: AppValues.sizeHeight * 20,
            ),
            DefaultButton(
                elevation: 0,
                text: AppStrings.signIn,
                onPressed: () => cubit.login()),
            SizedBox(
              height: AppValues.sizeHeight * 20,
            ),
          ],
        ),
      ),
    );
  }
}
