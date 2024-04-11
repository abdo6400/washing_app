import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/components/default_components/default_appbar.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../components/forget_password_components/reset_password_form.dart';
import '../../components/shared_components/top_Section.dart';
import '../../cubit/ui_cubit/authentication_ui_cubit.dart';


class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

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
                title: AppStrings.resetPassword,
                content: AppStrings.unlockPassword,
              ),
              ResetPasswordForm(),
            ],
          ),
        ),
      ),
    );
  }
}
