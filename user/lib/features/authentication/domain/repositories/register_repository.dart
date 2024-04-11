import 'package:car_washing/features/authentication/domain/entities/car_types.dart';
import 'package:dartz/dartz.dart';
import '../../../../config/database/error/failures.dart';
import '../../data/models/register_params_model.dart';
import '../entities/auth.dart';

abstract class RegisterRepository {
  Future<Either<Failure, Auth>> register(
      {required RegisterParamsModel registerParams});
  Future<Either<Failure, Auth>> registerWithGoogle();
  Future<Either<Failure, CarTypes>> getCarTypes();
  Future<Either<Failure, Auth>> checkEmail({required String email});
  Future<Either<Failure, Auth>> resendCode({required String email});
  Future<Either<Failure, Auth>> verifyEmail({required String secureKey,required String code});
}
