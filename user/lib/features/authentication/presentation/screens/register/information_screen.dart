import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/components/default_components/default_appbar.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../components/register_components/information_form.dart';
import '../../components/shared_components/bottom_section.dart';
import '../../components/shared_components/top_Section.dart';
import '../../cubit/ui_cubit/authentication_ui_cubit.dart';

class InformationScreen extends StatelessWidget {
  const InformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationUiCubit(),
      child: SafeArea(
        child: Scaffold(
          appBar: const DefaultAppBar(
            addLang: true,
            addLeadingButton: true,
          ),
          body: ListView(
            children: const [
              TopSection(
                title: AppStrings.registerAccount,
                content: AppStrings.fillYourPersonalDetails,
              ),
              InformationForm(),
            ],
          ),
          bottomNavigationBar: BottomSection(
            firstTitle: AppStrings.alreadyHaveAccount,
            secondTitle: AppStrings.signIn,
            function: () => Navigator.of(context).pop(),
          ),
        ),
      ),
    );
  }
}
