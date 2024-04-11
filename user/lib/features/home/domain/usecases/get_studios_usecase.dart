
import 'package:car_washing/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../../config/database/error/failures.dart';
import '../../../../../core/bloc/usecases/usecase.dart';
import '../../../../core/entities/studio.dart';

class GetStudiosUseCase extends UseCase<List<Studio>, String> {
  final HomeRepository _homeRepository;

  GetStudiosUseCase({required HomeRepository homeRepository})
      : _homeRepository = homeRepository;
  @override
  Future<Either<Failure, List<Studio>>> call(String params) =>
      _homeRepository.getStudios(params);
}
