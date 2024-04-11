import 'package:car_washing/config/locale/app_localizations.dart';
import 'package:flutter/material.dart';
import '../../../../../core/components/default_components/default_button.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_values.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultButton(
        elevation: 0,
        margin: EdgeInsets.symmetric(horizontal: AppValues.marginWidth * 20),
        background: AppColors.nearlyWhite,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: AppValues.paddingHeight * 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppImages.googleLogo),
              SizedBox(
                width: AppValues.sizeWidth * 15,
              ),
              Text(
                AppStrings.signInWithGoogle.tr(context),
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontSize: AppValues.font * 15,
                    ),
              ),
            ],
          ),
        ),
        onPressed: () => {});
  }
}
