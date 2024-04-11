import 'package:car_washing/config/database/error/failures.dart';


import 'package:car_washing/features/home/data/datasources/home_remote_data_source.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/entities/studio.dart';
import '../../domain/entities/category.dart';
import '../../domain/repositories/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteDataSource _homeRemoteDataSource;

  HomeRepositoryImpl({required HomeRemoteDataSource homeRemoteDataSource})
      : _homeRemoteDataSource = homeRemoteDataSource;
  @override
  Future<Either<Failure, List<Studio>>> getPopularStudios() async {
    try {
      final response = await _homeRemoteDataSource.getPopularStudios();

      return Right(response);
    } on ServerFailure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, List<Category>>> getServices() async {
    try {
      final response = await _homeRemoteDataSource.getServices();

      return Right(response);
    } on ServerFailure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, List<Studio>>> getStudios(String id) async {
    try {
      final response = await _homeRemoteDataSource.getStudios(id);

      return Right(response);
    } on ServerFailure catch (failure) {
      return Left(failure);
    }
  }
}
