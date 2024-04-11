import 'package:dartz/dartz.dart';

import '../../../../../config/database/error/failures.dart';
import '../../../../../core/bloc/usecases/usecase.dart';
import '../../entities/auth.dart';
import '../../repositories/forget_password_repository.dart';

class ForgetPasswordResendCodeUseCase extends UseCase<Auth, String> {
  final ForgetPasswordRepository _forgetPasswordRepository;

  ForgetPasswordResendCodeUseCase(
      {required ForgetPasswordRepository forgetPasswordRepository})
      : _forgetPasswordRepository = forgetPasswordRepository;
  @override
  Future<Either<Failure, Auth>> call(params) =>
      _forgetPasswordRepository.resendCode(email: params);
}
