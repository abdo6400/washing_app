
import 'package:car_washing/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../../config/database/error/failures.dart';
import '../../../../../core/bloc/usecases/usecase.dart';
import '../../../../core/entities/studio.dart';

class GetPopularStudiosUseCase extends UseCase<List<Studio>, NoParams> {
  final HomeRepository _homeRepository;

  GetPopularStudiosUseCase({required HomeRepository homeRepository})
      : _homeRepository = homeRepository;
  @override
  Future<Either<Failure, List<Studio>>> call(params) =>
      _homeRepository.getPopularStudios();
}
