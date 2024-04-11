import 'package:dartz/dartz.dart';

import '../../../../../config/database/error/failures.dart';
import '../../../../../core/bloc/usecases/usecase.dart';
import '../../entities/auth.dart';
import '../../repositories/register_repository.dart';

class ResendCodeUseCase extends UseCase<Auth, String> {
  final RegisterRepository _registerRepository;

  ResendCodeUseCase({required RegisterRepository registerRepository})
      : _registerRepository = registerRepository;
  @override
  Future<Either<Failure, Auth>> call(params) =>
      _registerRepository.resendCode(email: params);
}
