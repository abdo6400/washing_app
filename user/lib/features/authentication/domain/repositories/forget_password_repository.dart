import 'package:dartz/dartz.dart';

import '../../../../config/database/error/failures.dart';
import '../entities/auth.dart';

abstract class ForgetPasswordRepository {
  Future<Either<Failure, Auth>> resetPassword(
      {required String email,
      required String newPassword,
      required String confirmNewPassword});
  Future<Either<Failure, Auth>> forgetPassword({required String email});
  Future<Either<Failure, Auth>> resendCode({required String email});
  Future<Either<Failure, Auth>> verifyEmail(
      {required String secureKey, required String code});
}
