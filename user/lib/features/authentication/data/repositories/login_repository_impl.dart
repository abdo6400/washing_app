import 'package:car_washing/config/database/error/failures.dart';
import 'package:car_washing/features/authentication/data/datasources/login_remote_data_source.dart';
import 'package:car_washing/features/authentication/data/models/auth_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../config/database/error/exceptions.dart';
import '../../domain/repositories/login_repository.dart';

class LoginRepositoryImpl extends LoginRepository {
  final LoginRemoteDataSource _loginRemoteDataSource;

  LoginRepositoryImpl({required LoginRemoteDataSource loginRemoteDataSource})
      : _loginRemoteDataSource = loginRemoteDataSource;

  @override
  Future<Either<Failure, AuthModel>> login(
      {required String email, required String password}) async {
    try {
      final response = await _loginRemoteDataSource.login(email, password);
      return Right(response);
    } on ServerException catch (failure) {
      return Left(ServerFailure(errorMessage: failure.errorMessage));
    }
  }

  @override
  Future<Either<Failure, AuthModel>> loginWithGoogle() async {
    try {
      final response = await _loginRemoteDataSource.loginWithGoogle();
      return Right(response);
    } on ServerException catch (failure) {
      return Left(ServerFailure(errorMessage: failure.errorMessage));
    }
  }
}
