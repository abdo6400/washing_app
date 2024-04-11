import 'package:car_washing/features/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/components/default_components/default_button.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_values.dart';
import '../shared_components/auth_text_field.dart';

class ForgetPasswordForm extends StatelessWidget {
  const ForgetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppValues.marginWidth * 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: AppValues.sizeHeight * 30,
          ),
          AuthTextField(
            title: AppStrings.emailAddress,
            controller: context.read<AuthenticationCubit>().forgetEmail,
            type: TextInputType.emailAddress,
            message: AppStrings.enterEmail,
          ),
          SizedBox(
            height: AppValues.sizeHeight * 30,
          ),
          DefaultButton(
              elevation: 0,
              text: AppStrings.resetPassword,
              onPressed: () =>
                  context.read<AuthenticationCubit>().forgetPassword(context)),
        ],
      ),
    );
  }
}
