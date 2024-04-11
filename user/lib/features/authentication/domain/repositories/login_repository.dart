import 'package:dartz/dartz.dart';

import '../../../../config/database/error/failures.dart';
import '../entities/auth.dart';

abstract class LoginRepository {
  Future<Either<Failure, Auth>> login(
      {required String email, required String password});
  Future<Either<Failure, Auth>> loginWithGoogle();
}
