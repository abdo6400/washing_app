import 'package:car_washing/config/locale/app_localizations.dart';
import 'package:flutter/material.dart';
import '../../../../../core/components/default_components/default_form_field.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_values.dart';

class ProfileTextField extends StatelessWidget {
  final String title;
  final String message;

  const ProfileTextField({
    super.key,
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title.tr(context),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: AppValues.font * 16,
                fontWeight: FontWeight.w700,
                letterSpacing: AppValues.sizeWidth * 2,
              ),
        ),
        SizedBox(
          height: AppValues.sizeHeight * 10,
        ),
        DefaultTextFormField(
            hint: message,
            readOnly: true,
            hintColor: AppColors.black,
            contentPadding: EdgeInsets.symmetric(
                horizontal: AppValues.paddingWidth * 20,
                vertical: AppValues.paddingHeight * 15),
            backgroundColor: AppColors.white,
            controller: null,
            type: TextInputType.text),
      ],
    );
  }
}
