import 'package:car_washing/features/authentication/domain/entities/car_types.dart';
import 'package:dartz/dartz.dart';

import '../../../../config/database/error/exceptions.dart';
import '../../../../config/database/error/failures.dart';
import '../../domain/repositories/register_repository.dart';
import '../datasources/register_remote_data_source.dart';
import '../models/auth_model.dart';
import '../models/register_params_model.dart';

class RegisterRepositoryImpl extends RegisterRepository {
  final RegisterRemoteDataSource _registerRemoteDataSource;

  RegisterRepositoryImpl(
      {required RegisterRemoteDataSource registerRemoteDataSource})
      : _registerRemoteDataSource = registerRemoteDataSource;

  @override
  Future<Either<Failure, AuthModel>> checkEmail({required String email}) async {
    try {
      final response = await _registerRemoteDataSource.checkEmail(email);
      return Right(response);
    } on ServerException catch (failure) {
      return Left(ServerFailure(errorMessage: failure.errorMessage));
    }
  }

  @override
  Future<Either<Failure, AuthModel>> register(
      {required RegisterParamsModel registerParams}) async {
    try {
      final response = await _registerRemoteDataSource.register(registerParams);
      return Right(response);
    } on ServerException catch (failure) {
      return Left(ServerFailure(errorMessage: failure.errorMessage));
    }
  }

  @override
  Future<Either<Failure, AuthModel>> registerWithGoogle() async {
    try {
      final response = await _registerRemoteDataSource.registerWithGoogle();
      return Right(response);
    } on ServerException catch (failure) {
      return Left(ServerFailure(errorMessage: failure.errorMessage));
    }
  }

  @override
  Future<Either<Failure, AuthModel>> resendCode({required String email}) async {
    try {
      final response = await _registerRemoteDataSource.resendCode(email);
      return Right(response);
    } on ServerException catch (failure) {
      return Left(ServerFailure(errorMessage: failure.errorMessage));
    }
  }

  @override
  Future<Either<Failure, AuthModel>> verifyEmail(
      {required String secureKey, required String code}) async {
    try {
      final response =
          await _registerRemoteDataSource.verifyEmail(code, secureKey);
      return Right(response);
    } on ServerException catch (failure) {
      return Left(ServerFailure(errorMessage: failure.errorMessage));
    }
  }

  @override
  Future<Either<Failure, CarTypes>> getCarTypes() async {
    try {
      final response = await _registerRemoteDataSource.getCarTypes();
      return Right(response);
    } on ServerException catch (failure) {
      return Left(ServerFailure(errorMessage: failure.errorMessage));
    }
  }
}
