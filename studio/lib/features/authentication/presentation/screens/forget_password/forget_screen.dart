import 'package:flutter/material.dart';
import '../../../../../core/components/default_components/default_appbar.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../components/forget_password_components/forget_password_form.dart';
import '../../components/shared_components/top_Section.dart';


class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  Scaffold(
          appBar: const DefaultAppBar(
            addLang: true,
            addLeadingButton: true,
          ),
          body: ListView(
            children: const [
              TopSection(
                title: AppStrings.forgetPassword,
                content: AppStrings.enterYourEmailAccount,
              ),
              ForgetPasswordForm(),
            ],
          ),
        ),
     
    );
  }
}
