import 'package:car_washing/features/profile/domain/entities/user.dart';
import 'package:car_washing/features/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../../config/database/error/failures.dart';
import '../../../../../core/bloc/usecases/usecase.dart';

class GetUserUseCase extends UseCase<User, NoParams> {
  final ProfileRepository _profileRepository;

  GetUserUseCase({required ProfileRepository profileRepository})
      : _profileRepository = profileRepository;
  @override
  Future<Either<Failure, User>> call(params) => _profileRepository.getUser();
}
