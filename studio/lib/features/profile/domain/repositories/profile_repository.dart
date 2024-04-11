
import 'package:dartz/dartz.dart';

import '../../../../config/database/error/failures.dart';
import '../entities/user.dart';

abstract class ProfileRepository {
  Future<Either<Failure, User>> getUser();
}
