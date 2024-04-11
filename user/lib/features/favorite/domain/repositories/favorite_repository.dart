import 'package:car_washing/config/database/error/failures.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/entities/studio.dart';

abstract class FavoriteRepository {
  Future<Either<Failure, List<Studio>>> getWishList();
  Future<Either<Failure, List<Studio>>> editWishList(String id,bool delete);
}
