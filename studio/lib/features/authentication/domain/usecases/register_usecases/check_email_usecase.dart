import 'package:dartz/dartz.dart';

import '../../../../../config/database/error/failures.dart';
import '../../../../../core/bloc/usecases/usecase.dart';
import '../../entities/auth.dart';
import '../../repositories/register_repository.dart';

class CheckEmailUseCase extends UseCase<Auth, String> {
  final RegisterRepository _registerRepository;

  CheckEmailUseCase({required RegisterRepository registerRepository})
      : _registerRepository = registerRepository;
  @override
  Future<Either<Failure, Auth>> call(params) =>
      _registerRepository.checkEmail(email: params);
}
