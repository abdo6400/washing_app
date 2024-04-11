import 'package:car_washing/config/locale/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/components/default_components/default_button.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_values.dart';
import '../../../../../core/utils/custom_validation.dart';
import '../../cubit/authentication_cubit.dart';
import '../shared_components/auth_text_field.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppValues.marginWidth * 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: AppValues.sizeHeight * 20,
          ),
          AuthTextField(
            title: AppStrings.emailAddress,
            controller: context.read<AuthenticationCubit>().registerEmail,
            type: TextInputType.emailAddress,
            validate: (value) => CustomValidationHandler.isValidEmail(value!).trVaildation(context),
            message: AppStrings.enterEmail,
          ),
          SizedBox(
            height: AppValues.sizeHeight * 20,
          ),
          DefaultButton(
              elevation: 0,
              text: AppStrings.signUp,
              onPressed: () =>
                  context.read<AuthenticationCubit>().checkEmail(context)),
          SizedBox(
            height: AppValues.sizeHeight * 20,
          ),
        ],
      ),
    );
  }
}
