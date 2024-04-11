part of 'authentication_ui_cubit.dart';

sealed class AuthenticationUiState extends Equatable {
  const AuthenticationUiState();

  @override
  List<Object> get props => [];
}

final class AuthenticationUiInitial extends AuthenticationUiState {}

final class InitialValue extends AuthenticationUiState {}

final class ValueChanged extends AuthenticationUiState {}
