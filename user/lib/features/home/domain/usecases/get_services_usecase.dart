import 'package:dartz/dartz.dart';
import '../../../../../config/database/error/failures.dart';
import '../../../../../core/bloc/usecases/usecase.dart';
import '../entities/category.dart';
import '../repositories/home_repository.dart';

class GetServicesUseCase extends UseCase<List<Category>, NoParams> {
  final HomeRepository _homeRepository;

  GetServicesUseCase({required HomeRepository homeRepository})
      : _homeRepository = homeRepository;
  @override
  Future<Either<Failure, List<Category>>> call(params) =>
      _homeRepository.getServices();
}
