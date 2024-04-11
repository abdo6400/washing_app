import 'package:car_studio/features/authentication/domain/entities/services.dart';
import 'package:dartz/dartz.dart';

import '../../../../../config/database/error/failures.dart';
import '../../../../../core/bloc/usecases/usecase.dart';
import '../../repositories/register_repository.dart';

class GetServicesUseCase extends UseCase<Services, NoParams> {
  final RegisterRepository _registerRepository;

  GetServicesUseCase({required RegisterRepository registerRepository})
      : _registerRepository = registerRepository;
  @override
  Future<Either<Failure, Services>> call(params) =>
      _registerRepository.getServices();
}
