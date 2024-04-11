import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:car_studio/core/utils/commons.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latlong2/latlong.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/bloc/usecases/usecase.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/custom_validation.dart';
import '../../data/models/register_params_model.dart';
import '../../domain/entities/auth.dart';
import '../../domain/entities/services.dart';
import '../../domain/usecases/forget_password_usecases/forget_password_usecase.dart';
import '../../domain/usecases/forget_password_usecases/forget_resend_code_usecase.dart';
import '../../domain/usecases/forget_password_usecases/forget_verify_email_usecase.dart';
import '../../domain/usecases/forget_password_usecases/reset_password_usecase.dart';
import '../../domain/usecases/login_usecases/login_usecase.dart';
import '../../domain/usecases/login_usecases/login_with_google_usecase.dart';
import '../../domain/usecases/register_usecases/check_email_usecase.dart';
import '../../domain/usecases/register_usecases/get_services_usecase.dart';
import '../../domain/usecases/register_usecases/register_usecase.dart';
import '../../domain/usecases/register_usecases/register_with_google.dart';
import '../../domain/usecases/register_usecases/resend_code_usecase.dart';
import '../../domain/usecases/register_usecases/verfiy_email_usecase.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final LoginUseCase _loginUseCase;
  final LoginWithGoogleUseCase _loginWithGoogleUseCase;
  final ForgetPasswordUseCase _forgetPasswordUseCase;
  final ResetPasswordUseCase _resetPasswordUseCase;
  final ForgetPasswordVerifyEmailUseCase _forgetPasswordVerifyEmailUseCase;
  final ForgetPasswordResendCodeUseCase _forgetPasswordResendCodeUseCase;
  final CheckEmailUseCase _checkEmailUseCase;
  final VerfiyEmailUseCase _verfiyEmailUseCase;
  final ResendCodeUseCase _resendCodeUseCase;
  final RegisterUseCase _registerUseCase;
  final RegisterWithGoogleUseCase _registerWithGoogleUseCase;
  final GetServicesUseCase _getServicesUseCase;
  AuthenticationCubit(
      {required LoginUseCase loginUseCase,
      required ForgetPasswordUseCase forgetPasswordUseCase,
      required ResetPasswordUseCase resetPasswordUseCase,
      required ForgetPasswordVerifyEmailUseCase
          forgetPasswordVerifyEmailUseCase,
      required ForgetPasswordResendCodeUseCase forgetPasswordResendCodeUseCase,
      required CheckEmailUseCase checkEmailUseCase,
      required VerfiyEmailUseCase verfiyEmailUseCase,
      required ResendCodeUseCase resendCodeUseCase,
      required RegisterUseCase registerUseCase,
      required RegisterWithGoogleUseCase registerWithGoogleUseCase,
      required LoginWithGoogleUseCase loginWithGoogleUseCase,
      required GetServicesUseCase getCarTypesUseCase})
      : _loginUseCase = loginUseCase,
        _forgetPasswordUseCase = forgetPasswordUseCase,
        _resetPasswordUseCase = resetPasswordUseCase,
        _forgetPasswordVerifyEmailUseCase = forgetPasswordVerifyEmailUseCase,
        _forgetPasswordResendCodeUseCase = forgetPasswordResendCodeUseCase,
        _checkEmailUseCase = checkEmailUseCase,
        _verfiyEmailUseCase = verfiyEmailUseCase,
        _resendCodeUseCase = resendCodeUseCase,
        _registerUseCase = registerUseCase,
        _registerWithGoogleUseCase = registerWithGoogleUseCase,
        _loginWithGoogleUseCase = loginWithGoogleUseCase,
        _getServicesUseCase = getCarTypesUseCase,
        super(AuthenticationInitial());
  // deal with states
  void dealWithStates(AuthenticationLoadedState state, BuildContext context) {
    context.hideLoader();
    if (state is LoginLoadedState) {
      saveToken(state.auth.token).then((value) {
        context.showToastMsg(
            msg: state.auth.message, toastState: ToastStates.success);
        context.navigateAndFinish(screenRoute: Routes.mainRoute);
      });
    } else if (state is RegisterLoadedState) {
      saveToken(state.auth.token).then((value) => context
          .showSuccessDialogToast(
              icon: AppImages.success,
              duration: const Duration(milliseconds: 1000),
              message: AppStrings.successfullyRegistered)
          .then((value) =>
              context.navigateAndFinish(screenRoute: Routes.mainRoute)));
    } else if (state is ResendCodeLoadedState) {
      secureKey = state.auth.token;
      startTimer();
      context.showToastMsg(
          msg: state.auth.message, toastState: ToastStates.success);
    } else if (state is VerifyEmailLoadedState) {
      context
          .showSuccessDialogToast(
              icon: AppImages.success,
              duration: const Duration(milliseconds: 1000),
              message: state.auth.message)
          .then((value) => context.navigateAndFinish(
              screenRoute: state.isRegistered
                  ? Routes.informationRoute
                  : Routes.resetPasswordRoute));
    } else if (state is CheckEmailLoadedState) {
      context
          .showSuccessDialogToast(
              icon: AppImages.email,
              duration: const Duration(milliseconds: 1000),
              title: AppStrings.checkYourEmail,
              message: AppStrings.checkYourEmailMessage)
          .then((value) {
        secureKey = state.auth.token;
        startTimer();
        context.navigateAndFinish(screenRoute: Routes.otpRegisterRoute);
      });
    } else if (state is ForgetPasswordLoadedState) {
      context
          .showSuccessDialogToast(
              icon: AppImages.email,
              duration: const Duration(milliseconds: 1000),
              title: AppStrings.checkYourEmail,
              message: AppStrings.checkYourEmailMessage)
          .then((value) {
        secureKey = state.auth.token;
        startTimer();
        context.navigateAndFinish(screenRoute: Routes.otpRoute);
      });
    } else if (state is ResetPasswordLoadedState) {
      context
          .showSuccessDialogToast(
              icon: AppImages.success,
              duration: const Duration(milliseconds: 1000),
              message: state.auth.message)
          .then((value) => Navigator.of(context).pop());
    }
  }

  // login variables
  final loginFormKey = GlobalKey<FormState>();
  final email = TextEditingController(), password = TextEditingController();
  // forget password variables
  final resetPasswordFormKey = GlobalKey<FormState>();
  final forgetEmail = TextEditingController(),
      newPassword = TextEditingController(),
      confirmNewPassword = TextEditingController();
  // register variables
  final registerFormKey = GlobalKey<FormState>();
  final registerEmail = TextEditingController(),
      registerpassword = TextEditingController(),
      name = TextEditingController(),
      phone = TextEditingController(),
      studioDescriptiopn = TextEditingController();
  final code = TextEditingController();
  XFile? logo;
  List<XFile> images = [];
  String? location;
  String secureKey = "";
  late Timer timer;
  int start = 120;
  Services? services;
  List<Map<String, String>> selectedServices = [];
  TimeOfDay openTime = TimeOfDay.now();
  TimeOfDay closeTime = TimeOfDay.now();
  // variables set functions
  setLocation(LatLng value) {
    location = "${value.latitude},${value.longitude}";
  }

  void setOpenTime(TimeOfDay timeOfDay) {
    emit(AuthUiChanging());
    openTime = timeOfDay;
    emit(AuthUiChanged());
  }

  void setCloseTime(TimeOfDay timeOfDay) {
    emit(AuthUiChanging());
    closeTime = timeOfDay;
    emit(AuthUiChanged());
  }

  void addImage(BuildContext context) async {
    emit(AuthUiChanging());
    final XFile? pickedImage = await context.showPickeImageDialog();
    if (pickedImage != null) {
      images.add(pickedImage);
    }
    emit(AuthUiChanged());
  }

  bool isChecked(String id) {
    try {
      selectedServices
          .firstWhere((element) => element["service"]!.compareTo(id) == 0);
      return true;
    } catch (e) {
      return false;
    }
  }

  updatePrice(String id, String price) {
    if (isChecked(id)) {
      Map<String, String> value = selectedServices
          .firstWhere((element) => element["service"]!.compareTo(id) == 0);
      value["price"] = price;
    }
  }

  void addService(String service, String price) {
    emit(AuthUiChanging());
    selectedServices.add({"service": service, "price": price});
    emit(AuthUiChanged());
  }

  void removeService(String service) {
    emit(AuthUiChanging());
    selectedServices
        .removeWhere((element) => element["service"]!.compareTo(service) == 0);
    emit(AuthUiChanged());
  }

  void clearAllValues() {
    // Clearing login form values
    loginFormKey.currentState?.reset();
    email.clear();
    password.clear();

    // Clearing forget password form values
    resetPasswordFormKey.currentState?.reset();
    forgetEmail.clear();
    newPassword.clear();
    confirmNewPassword.clear();

    // Clearing register form values

    registerFormKey.currentState?.reset();
    registerEmail.clear();
    registerpassword.clear();
    name.clear();
    phone.clear();
    studioDescriptiopn.clear();
    selectedServices.clear();
    // Clearing other variables
    code.clear();
    logo = null;
    images.clear();
    location = null;
    secureKey = "";
    start = 120;
  }
  // login functions

  Future<void> login() async {
    if (loginFormKey.currentState!.validate()) {
      emit(AuthenticationLoadingState());
      emit(await _loginUseCase(
              LoginParams(password: password.text, email: email.text))
          .then((value) => value.fold(
              (l) => AuthenticationErrorState(l.errorMessage),
              (r) => LoginLoadedState(r))));
    }
  }

  Future<void> loginWithGoogle() async {
    emit(AuthenticationLoadingState());
    emit(await _loginWithGoogleUseCase(NoParams()).then((value) => value.fold(
        (l) => AuthenticationErrorState(l.errorMessage),
        (r) => LoginLoadedState(r))));
  }

  // forget password functions

  Future<void> forgetPassword(BuildContext context) async {
    if (CustomValidationHandler.isValidEmail(forgetEmail.text) == null) {
      emit(AuthenticationLoadingState());
      emit(await _forgetPasswordUseCase(forgetEmail.text).then((value) =>
          value.fold((l) => AuthenticationErrorState(l.errorMessage),
              (r) => ForgetPasswordLoadedState(r))));
    } else {
      context.showToastMsg(
          msg: AppStrings.pleaseEnterVaildEmail, toastState: ToastStates.error);
    }
  }

  Future<void> forgetResendCode() async {
    emit(AuthenticationLoadingState());
    emit(await _forgetPasswordResendCodeUseCase(forgetEmail.text).then(
        (value) => value.fold((l) => AuthenticationErrorState(l.errorMessage),
            (r) => ResendCodeLoadedState(r))));
  }

  Future<void> forgetVerifyEmail(BuildContext context) async {
    if (CustomValidationHandler.isVaildCode(code.text)) {
      emit(AuthenticationLoadingState());
      emit(await _forgetPasswordVerifyEmailUseCase(
              ForgetVerifyParams(code: code.text, secureKey: secureKey))
          .then((value) => value.fold(
              (l) => AuthenticationErrorState(l.errorMessage),
              (r) => VerifyEmailLoadedState(r, false))));
    } else {
      context.showToastMsg(
          msg: AppStrings.pleaseEnterVaildCode, toastState: ToastStates.error);
    }
  }

  Future<void> resetPassword() async {
    if (resetPasswordFormKey.currentState!.validate()) {
      emit(AuthenticationLoadingState());
      emit(await _resetPasswordUseCase(ResetPasswordParams(
              newPassword: newPassword.text,
              email: email.text,
              confirmNewPassword: confirmNewPassword.text))
          .then((value) => value.fold(
              (l) => AuthenticationErrorState(l.errorMessage),
              (r) => ResetPasswordLoadedState(r))));
    }
  }

  // register functions

  Future<void> resendCode() async {
    emit(AuthenticationLoadingState());
    emit(await _resendCodeUseCase(registerEmail.text).then((value) =>
        value.fold((l) => AuthenticationErrorState(l.errorMessage),
            (r) => ResendCodeLoadedState(r))));
  }

  Future<void> checkEmail(BuildContext context) async {
    if (CustomValidationHandler.isValidEmail(registerEmail.text) == null) {
      emit(AuthenticationLoadingState());
      emit(await _checkEmailUseCase(registerEmail.text).then((value) =>
          value.fold((l) => AuthenticationErrorState(l.errorMessage),
              (r) => CheckEmailLoadedState(r))));
    } else {
      context.showToastMsg(
          msg: AppStrings.pleaseEnterVaildEmail, toastState: ToastStates.error);
    }
  }

  Future<void> getServices() async {
    emit(AuthUiChanging());
    await _getServicesUseCase(NoParams())
        .then((value) => value.fold((l) => null, (r) => services = r));
    emit(AuthUiChanged());
  }

  Future<void> verifyEmail(BuildContext context) async {
    if (CustomValidationHandler.isVaildCode(code.text)) {
      emit(AuthenticationLoadingState());
      emit(await _verfiyEmailUseCase(
              VerifyParams(code: code.text, secureKey: secureKey))
          .then((value) => value.fold(
                  (l) => AuthenticationErrorState(l.errorMessage), (r) async {
                await getServices();
                return VerifyEmailLoadedState(r, true);
              })));
    } else {
      context.showToastMsg(
          msg: AppStrings.pleaseEnterVaildCode, toastState: ToastStates.error);
    }
  }

  Future<void> register(BuildContext context) async {
    if (images.isNotEmpty &&
        selectedServices.isNotEmpty &&
        studioDescriptiopn.text.isNotEmpty) {
      emit(AuthenticationLoadingState());
      emit(await _registerUseCase(RegisterParamsModel(
        email: registerEmail.text,
        logo: logo!,
        name: name.text,
        phone: phone.text,
        password: registerpassword.text,
        location: location!,
        studioImages: images,
        services: selectedServices,
        description: studioDescriptiopn.text,
        openTime: openTime.format(context),
        closeTime: closeTime.format(context),
      )).then((value) => value.fold(
          (l) => AuthenticationErrorState(l.errorMessage),
          (r) => RegisterLoadedState(r))));
    } else {
      context.showToastMsg(
          msg: AppStrings.fillStudioProfileDetails,
          toastState: ToastStates.error);
    }
  }

  Future<void> registerWithGoogle() async {
    emit(AuthenticationLoadingState());
    emit(await _registerWithGoogleUseCase(NoParams()).then((value) =>
        value.fold((l) => AuthenticationErrorState(l.errorMessage),
            (r) => RegisterLoadedState(r))));
  }

  // resend code functions

  void startTimer() {
    emit(TimerStartState());
    start = 120;
    code.clear();
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start == 0) {
          timer.cancel();
          emit(TimerCountDownState());
        } else {
          emit(TimerStartState());
          start--;
          emit(TimerCountDownState());
        }
      },
    );
  }

  void pikeImage(BuildContext context) async {
    emit(AuthUiChanging());
    final XFile? pickedImage = await context.showPickeImageDialog();
    if (pickedImage != null) {
      logo = pickedImage;
    }
    emit(AuthUiChanged());
  }
}
