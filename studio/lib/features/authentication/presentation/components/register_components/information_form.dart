import 'package:car_studio/core/utils/commons.dart';
import 'package:car_studio/features/authentication/presentation/components/register_components/studio_information_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/components/default_components/default_button.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_enums.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_values.dart';
import '../../cubit/authentication_cubit.dart';
import '../../cubit/ui_cubit/authentication_ui_cubit.dart';
import 'location_section.dart';
import 'personal_information_section.dart';

class InformationForm extends StatelessWidget {
  const InformationForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppValues.marginWidth * 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: AppValues.sizeHeight * 20,
          ),
          [
            const PersonalInformationSection(),
            const LocationInformationSection(),
            const StudioInformationSection()
          ][context.watch<AuthenticationUiCubit>().selectedSection],
          SizedBox(
            height: AppValues.sizeHeight * 20,
          ),
          SizedBox(
            height: AppValues.sizeHeight * 6,
            width: AppValues.sizeWidth * 120,
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: LinearProgressIndicator(
                  value: (1 / 3) *
                      (context.watch<AuthenticationUiCubit>().selectedSection +
                          1),
                  color: AppColors.blueLight,
                  backgroundColor: AppColors.lightGrey2,
                  borderRadius: BorderRadius.circular(AppValues.radius * 12)),
            ),
          ),
          SizedBox(
            height: AppValues.sizeHeight * 20,
          ),
          Row(
            children: [
              SizedBox(
                width: AppValues.sizeWidth * 20,
              ),
              if (context.watch<AuthenticationUiCubit>().selectedSection != 0)
                Row(
                  children: [
                    GestureDetector(
                        onTap: () => context
                            .read<AuthenticationUiCubit>()
                            .changeSection(false),
                        child: const CircleAvatar(
                            backgroundColor: AppColors.lightGrey,
                            child: Icon(
                              Icons.arrow_back_rounded,
                              color: AppColors.black,
                            ))),
                    SizedBox(
                      width: AppValues.sizeWidth * 20,
                    ),
                  ],
                ),
              Expanded(
                child: DefaultButton(
                    borderColor: AppColors.grey1,
                    textColor: AppColors.white,
                    padding: EdgeInsets.symmetric(
                        vertical: AppValues.paddingHeight * 15),
                    elevation: 0,
                    text: (context
                                .watch<AuthenticationUiCubit>()
                                .selectedSection !=
                            2)
                        ? AppStrings.next
                        : AppStrings.signUp,
                    onPressed: () {
                      final authCubit = context.read<AuthenticationCubit>();
                      context.closeKeyboard();
                      if (context
                              .read<AuthenticationUiCubit>()
                              .selectedSection ==
                          0) {
                        if (authCubit.registerFormKey.currentState!
                            .validate()) {
                          context
                              .read<AuthenticationUiCubit>()
                              .changeSection(true);
                        }
                      } else if (context
                              .read<AuthenticationUiCubit>()
                              .selectedSection ==
                          1) {
                        if (authCubit.logo != null &&
                            authCubit.location != null) {
                          context
                              .read<AuthenticationUiCubit>()
                              .changeSection(true);
                        } else {
                          context.showToastMsg(
                              msg: AppStrings.fillStudioProfileDetails,
                              toastState: ToastStates.error);
                        }
                      } else {
                        authCubit.register(context);
                      }
                    }),
              ),
              SizedBox(
                width: AppValues.sizeWidth * 20,
              ),
            ],
          ),
          SizedBox(
            height: AppValues.sizeHeight * 30,
          ),
        ],
      ),
    );
  }
}
