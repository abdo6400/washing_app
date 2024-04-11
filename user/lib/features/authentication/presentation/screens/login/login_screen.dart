import 'package:car_washing/core/utils/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../config/routes/app_routes.dart';
import '../../../../../core/components/default_components/default_appbar.dart';
import '../../../../../core/utils/app_enums.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../components/login_components/login_form.dart';
import '../../components/shared_components/bottom_section.dart';
import '../../components/shared_components/social_button.dart';
import '../../components/shared_components/top_Section.dart';
import '../../cubit/authentication_cubit.dart';
import '../../cubit/ui_cubit/authentication_ui_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationUiCubit(),
      child: BlocListener<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {
          if (state is AuthenticationLoadingState) {
            context.closeKeyboard();
            context.showLoader();
          } else if (state is AuthenticationErrorState) {
            context.hideLoader();
            context.showInfoDialog(state.message, AlertDialogType.error);
          } else if (state is AuthenticationLoadedState) {
            context.read<AuthenticationCubit>().dealWithStates(state, context);
          }
        },
        child: SafeArea(
          child: Scaffold(
            appBar: const DefaultAppBar(
              addLang: true,
              addLeadingButton: false,
            ),
            body: ListView(
              children: const [
                TopSection(
                  title: AppStrings.helloAgain,
                  content: AppStrings.fillYourDetails,
                ),
                LoginForm(),
                SocialButton()
              ],
            ),
            bottomNavigationBar: BottomSection(
              firstTitle: AppStrings.newUser,
              secondTitle: AppStrings.createAccount,
              function: () =>
                  context.navigateTo(screenRoute: Routes.registerRoute),
            ),
          ),
        ),
      ),
    );
  }
}
