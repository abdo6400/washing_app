import 'package:car_washing/core/utils/app_values.dart';
import 'package:car_washing/features/authentication/presentation/components/shared_components/otp_form.dart';
import 'package:flutter/material.dart';
import '../../../../../core/components/default_components/default_appbar.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../components/shared_components/top_Section.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const DefaultAppBar(
          addLang: true,
          addLeadingButton: true,
        ),
        body: ListView(
          children: [
            const TopSection(
              title: AppStrings.otpVerification,
              content: AppStrings.otpVerificationMessage,
            ),
            SizedBox(
              height: AppValues.sizeHeight * 30,
            ),
            const OtpForm(isRegistered: false,)
          ],
        ),
      ),
    );
  }
}
