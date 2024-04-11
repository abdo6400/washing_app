import 'package:flutter/material.dart';
import '../../../../../core/components/default_components/default_appbar.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../components/register_components/register_form.dart';
import '../../components/shared_components/bottom_section.dart';
import '../../components/shared_components/social_button.dart';
import '../../components/shared_components/top_Section.dart';


class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
          appBar: const DefaultAppBar(
            addLang: true,
            addLeadingButton: true,
          ),
          body: ListView(
            children: const [
              TopSection(
                title: AppStrings.registerAccount,
                content: AppStrings.enterYourEmailAccountToSignUpWith,
              ),
              RegisterForm(),
              SocialButton()
            ],
          ),
          bottomNavigationBar: BottomSection(
            firstTitle: AppStrings.alreadyHaveAccount,
            secondTitle: AppStrings.signIn,
            function: () => Navigator.of(context).pop(),
          ),
        ),
    
    );
  }
}
