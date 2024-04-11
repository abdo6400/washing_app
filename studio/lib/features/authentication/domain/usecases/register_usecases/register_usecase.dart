import 'package:dartz/dartz.dart';

import '../../../../../config/database/error/failures.dart';
import '../../../../../core/bloc/usecases/usecase.dart';
import '../../../data/models/register_params_model.dart';
import '../../entities/auth.dart';
import '../../repositories/register_repository.dart';

class RegisterUseCase extends UseCase<Auth, RegisterParamsModel> {
  final RegisterRepository _registerRepository;

  RegisterUseCase({required RegisterRepository registerRepository})
      : _registerRepository = registerRepository;
  @override
  Future<Either<Failure, Auth>> call(params) =>
      _registerRepository.register(registerParams: params);
}
