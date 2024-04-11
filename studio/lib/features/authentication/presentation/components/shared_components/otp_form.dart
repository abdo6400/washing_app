
import 'package:car_studio/config/locale/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

import '../../../../../core/components/default_components/default_button.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_values.dart';
import '../../cubit/authentication_cubit.dart';

class OtpForm extends StatefulWidget {
  final bool isRegistered;
  const OtpForm({super.key, required this.isRegistered});

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  late AuthenticationCubit cubit;

  @override
  void initState() {
    super.initState();
    if (mounted) {
      cubit = context.read<AuthenticationCubit>();
    }
  }

  @override
  void dispose() {
    if (mounted) {
      cubit.timer.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppValues.marginWidth * 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            AppStrings.otpCode.tr(context),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: AppValues.font * 16,
                  fontWeight: FontWeight.w700,
                  letterSpacing: AppValues.sizeWidth * 2,
                ),
          ),
          SizedBox(
            height: AppValues.sizeHeight * 20,
          ),
          Directionality(
            textDirection: TextDirection.ltr,
            child: Pinput(
              length: 4,
              keyboardType: TextInputType.number,
              pinAnimationType: PinAnimationType.slide,
              showCursor: true,
              controller: cubit.code,
              preFilledWidget: Container(
                decoration: BoxDecoration(
                    color: AppColors.lightGrey,
                    borderRadius: BorderRadius.circular(AppValues.radius * 12)),
              ),
              cursor: Container(
                decoration: BoxDecoration(
                    color: AppColors.nearlyWhite,
                    borderRadius: BorderRadius.circular(AppValues.radius * 12)),
              ),
              defaultPinTheme: PinTheme(
                width: AppValues.sizeWidth * 90,
                margin:
                    EdgeInsets.symmetric(horizontal: AppValues.marginWidth * 5),
                height: AppValues.sizeHeight * 80,
                textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w900, color: AppColors.black),
                decoration: BoxDecoration(
                    color: AppColors.lightGrey,
                    borderRadius: BorderRadius.circular(AppValues.radius * 12)),
              ),
            ),
          ),
          SizedBox(
            height: AppValues.sizeHeight * 30,
          ),
          DefaultButton(
              elevation: 0,
              text: AppStrings.verfiy,
              onPressed: () => widget.isRegistered
                  ? cubit.verifyEmail(context)
                  : cubit.forgetVerifyEmail(context)),
          SizedBox(
            height: AppValues.sizeHeight * 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  TextButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.zero)),
                      onPressed: context.read<AuthenticationCubit>().start != 0
                          ? null
                          : () => widget.isRegistered
                              ? cubit.resendCode()
                              : cubit.forgetResendCode(),
                      child: Text(
                        AppStrings.resendCodeTo.tr(context),
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                              fontSize: AppValues.font * 10,
                              fontWeight: FontWeight.w400,
                              letterSpacing: AppValues.sizeWidth * 2,
                              color:
                                  context.read<AuthenticationCubit>().start != 0
                                      ? AppColors.grey
                                      : AppColors.primary,
                            ),
                      )),
                  SizedBox(
                    width: AppValues.sizeWidth * 5,
                  ),
                  Text(
                    widget.isRegistered
                        ? cubit.registerEmail.text
                        : cubit.forgetEmail.text,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: AppValues.font * 10,
                          fontWeight: FontWeight.w700,
                          letterSpacing: AppValues.sizeWidth * 2,
                          color: AppColors.black,
                        ),
                  ),
                ],
              ),
              Text(
                context.watch<AuthenticationCubit>().start == 0
                    ? AppStrings.codeExpired.tr(context).toString()
                    : context.read<AuthenticationCubit>().start.toString(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: AppValues.font * 10,
                      fontWeight: FontWeight.w400,
                      letterSpacing: AppValues.sizeWidth * 2,
                      color: AppColors.grey,
                    ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
