part of 'authentication_cubit.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthUiChanging extends AuthenticationState {}

class AuthUiChanged extends AuthenticationState {}

class TimerStartState extends AuthenticationState {}

class TimerCountDownState extends AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoadingState extends AuthenticationState {}

class AuthenticationErrorState extends AuthenticationState {
  final String message;

  const AuthenticationErrorState(this.message);
}

abstract class AuthenticationLoadedState extends AuthenticationState {
  final Auth auth;

  const AuthenticationLoadedState(this.auth);
}

class LoginLoadedState extends AuthenticationLoadedState {
  const LoginLoadedState(super.auth);
}

class RegisterLoadedState extends AuthenticationLoadedState {
  const RegisterLoadedState(super.auth);
}

class ResendCodeLoadedState extends AuthenticationLoadedState {
  const ResendCodeLoadedState(super.auth);
}

class VerifyEmailLoadedState extends AuthenticationLoadedState {
  final bool isRegistered;
  const VerifyEmailLoadedState(super.auth, this.isRegistered);
}

class CheckEmailLoadedState extends AuthenticationLoadedState {
  const CheckEmailLoadedState(super.auth);
}

class ForgetPasswordLoadedState extends AuthenticationLoadedState {
  const ForgetPasswordLoadedState(super.auth);
}

class ResetPasswordLoadedState extends AuthenticationLoadedState {
  const ResetPasswordLoadedState(super.auth);
}
