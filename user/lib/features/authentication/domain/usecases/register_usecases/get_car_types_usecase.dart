import 'package:car_washing/features/authentication/domain/entities/car_types.dart';
import 'package:dartz/dartz.dart';

import '../../../../../config/database/error/failures.dart';
import '../../../../../core/bloc/usecases/usecase.dart';

import '../../repositories/register_repository.dart';

class GetCarTypesUseCase extends UseCase<CarTypes, NoParams> {
  final RegisterRepository _registerRepository;

  GetCarTypesUseCase({required RegisterRepository registerRepository})
      : _registerRepository = registerRepository;
  @override
  Future<Either<Failure, CarTypes>> call(params) =>
      _registerRepository.getCarTypes();
}
