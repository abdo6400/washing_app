import 'package:car_washing/config/database/error/failures.dart';
import 'package:car_washing/features/profile/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepository {
  Future<Either<Failure, User>> getUser();
}
