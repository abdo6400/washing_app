import 'package:dartz/dartz.dart';
import '../../../../config/database/error/exceptions.dart';
import '../../../../config/database/error/failures.dart';
import '../../domain/repositories/forget_password_repository.dart';
import '../datasources/forget_password_renote_data_source.dart';
import '../models/auth_model.dart';

class ForgetPasswordRepositoryImpl extends ForgetPasswordRepository {
  final ForgetPasswordRemoteDataSource _forgetPasswordRemoteDataSource;

  ForgetPasswordRepositoryImpl(
      {required ForgetPasswordRemoteDataSource forgetPasswordRemoteDataSource})
      : _forgetPasswordRemoteDataSource = forgetPasswordRemoteDataSource;

  @override
  Future<Either<Failure, AuthModel>> forgetPassword(
      {required String email}) async {
    try {
      final response =
          await _forgetPasswordRemoteDataSource.forgetPassword(email);
      return Right(response);
    } on ServerException catch (failure) {
      return Left(ServerFailure(errorMessage: failure.errorMessage));
    }
  }

  @override
  Future<Either<Failure, AuthModel>> resendCode({required String email}) async {
    try {
      final response = await _forgetPasswordRemoteDataSource.resendCode(email);
      return Right(response);
    } on ServerException catch (failure) {
      return Left(ServerFailure(errorMessage: failure.errorMessage));
    }
  }

  @override
  Future<Either<Failure, AuthModel>> resetPassword(
      {required String email,
      required String newPassword,
      required String confirmNewPassword}) async {
    try {
      final response = await _forgetPasswordRemoteDataSource.resetPassword(
          email, newPassword, confirmNewPassword);
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
          await _forgetPasswordRemoteDataSource.verifyEmail(code, secureKey);
      return Right(response);
    } on ServerException catch (failure) {
      return Left(ServerFailure(errorMessage: failure.errorMessage));
    }
  }
}
