import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../config/database/error/failures.dart';
import '../../../../../core/bloc/usecases/usecase.dart';
import '../../entities/auth.dart';
import '../../repositories/forget_password_repository.dart';

class ResetPasswordUseCase extends UseCase<Auth, ResetPasswordParams> {
  final ForgetPasswordRepository _forgetPasswordRepository;

  ResetPasswordUseCase(
      {required ForgetPasswordRepository forgetPasswordRepository})
      : _forgetPasswordRepository = forgetPasswordRepository;
  @override
  Future<Either<Failure, Auth>> call(params) =>
      _forgetPasswordRepository.resetPassword(
          email: params.email,
          newPassword: params.newPassword,
          confirmNewPassword: params.confirmNewPassword);
}

class ResetPasswordParams extends Equatable {
  final String email;
  final String newPassword;
  final String confirmNewPassword;
  const ResetPasswordParams({
    required this.email,
    required this.newPassword,
    required this.confirmNewPassword,
  });

  @override
  List<Object?> get props => [email, newPassword, confirmNewPassword];
}
