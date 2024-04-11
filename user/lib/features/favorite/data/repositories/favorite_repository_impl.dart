import 'package:car_washing/config/database/error/failures.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/entities/studio.dart';
import '../../domain/repositories/favorite_repository.dart';
import '../datasources/favorite_remote_data_source.dart';

class FavoriteRepositoryImpl extends FavoriteRepository {
  final FavoriteRemoteDataSource _favoriteRemoteDataSource;

  FavoriteRepositoryImpl(
      {required FavoriteRemoteDataSource favoriteRemoteDataSource})
      : _favoriteRemoteDataSource = favoriteRemoteDataSource;
  @override
  Future<Either<Failure, List<Studio>>> editWishList(String id,bool delete) async {
    try {
      final response = await _favoriteRemoteDataSource.editWishList(id,delete);

      return Right(response);
    } on ServerFailure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, List<Studio>>> getWishList() async {
    try {
      final response = await _favoriteRemoteDataSource.getWishList();

      return Right(response);
    } on ServerFailure catch (failure) {
      return Left(failure);
    }
  }
}
