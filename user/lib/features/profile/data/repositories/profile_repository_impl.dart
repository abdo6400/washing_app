import 'package:car_washing/config/database/error/failures.dart';
import 'package:car_washing/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:car_washing/features/profile/domain/entities/user.dart';
import 'package:dartz/dartz.dart';
import '../../../../config/database/error/exceptions.dart';
import '../../domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileRemoteDataSource _profileRemoteDataSource;

  ProfileRepositoryImpl(
      {required ProfileRemoteDataSource profileRemoteDataSource})
      : _profileRemoteDataSource = profileRemoteDataSource;
  @override
  Future<Either<Failure, User>> getUser() async {
    try {
      final response = await _profileRemoteDataSource.getUser();

      return Right(response);
    } on ServerException catch (failure) {
      return Left(ServerFailure(errorMessage: failure.errorMessage));
    }
  }
}
