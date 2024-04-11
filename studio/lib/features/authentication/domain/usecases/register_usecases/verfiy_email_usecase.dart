import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../config/database/error/failures.dart';
import '../../../../../core/bloc/usecases/usecase.dart';
import '../../entities/auth.dart';
import '../../repositories/register_repository.dart';

class VerfiyEmailUseCase extends UseCase<Auth, VerifyParams> {
  final RegisterRepository _registerRepository;

  VerfiyEmailUseCase({required RegisterRepository registerRepository})
      : _registerRepository = registerRepository;
  @override
  Future<Either<Failure, Auth>> call(params) => _registerRepository.verifyEmail(
      code: params.code, secureKey: params.secureKey);
}

class VerifyParams extends Equatable {
  final String code;
  final String secureKey;
  const VerifyParams({
    required this.code,
    required this.secureKey,
  });

  @override
  List<Object?> get props => [code, secureKey];
}
