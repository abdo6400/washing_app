import 'package:car_washing/config/database/error/failures.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/entities/studio.dart';
import '../entities/category.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<Studio>>> getPopularStudios();
  Future<Either<Failure, List<Studio>>> getStudios(String id);
  Future<Either<Failure, List<Category>>> getServices();
}
