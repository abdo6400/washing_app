import 'package:car_washing/features/favorite/domain/repositories/favorite_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../../config/database/error/failures.dart';
import '../../../../../core/bloc/usecases/usecase.dart';
import '../../../../core/entities/studio.dart';


class GetWishListUseCase extends UseCase<List<Studio>, NoParams> {
  final FavoriteRepository _favoriteRepository;

  GetWishListUseCase({required FavoriteRepository favoriteRepository})
      : _favoriteRepository = favoriteRepository;

  @override
  Future<Either<Failure, List<Studio>>> call(params) =>
      _favoriteRepository.getWishList();
}
