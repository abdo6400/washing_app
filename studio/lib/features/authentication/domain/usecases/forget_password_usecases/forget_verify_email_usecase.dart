import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../config/database/error/failures.dart';
import '../../../../../core/bloc/usecases/usecase.dart';
import '../../entities/auth.dart';
import '../../repositories/forget_password_repository.dart';

class ForgetPasswordVerifyEmailUseCase extends UseCase<Auth, ForgetVerifyParams> {
  final ForgetPasswordRepository _forgetPasswordRepository;

  ForgetPasswordVerifyEmailUseCase(
      {required ForgetPasswordRepository forgetPasswordRepository})
      : _forgetPasswordRepository = forgetPasswordRepository;
  @override
  Future<Either<Failure, Auth>> call(params) => _forgetPasswordRepository
      .verifyEmail(code: params.code, secureKey: params.secureKey);
}

class ForgetVerifyParams extends Equatable {
  final String code;
  final String secureKey;
  const ForgetVerifyParams({
    required this.code,
    required this.secureKey,
  });

  @override
  List<Object?> get props => [code, secureKey];
}
