import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'authentication_ui_state.dart';

class AuthenticationUiCubit extends Cubit<AuthenticationUiState> {
  AuthenticationUiCubit() : super(AuthenticationUiInitial());
  int selectedSection = 0;
  bool password = true;
  bool confirmPassword = true;

  void changePasswordVisiblity() {
    emit(InitialValue());
    password = !password;
    emit(ValueChanged());
  }

  void changeConfirmPasswordVisiblity() {
    emit(InitialValue());
    confirmPassword = !confirmPassword;
    emit(ValueChanged());
  }

  void changeSection(bool forward) {
    emit(InitialValue());
    if (forward) {
      if (selectedSection < 2) {
        selectedSection = selectedSection + 1;
      }
    } else {
      selectedSection = selectedSection - 1;
    }

    emit(ValueChanged());
  }
}
