import 'package:dartz/dartz.dart';
import '../../../../../config/database/error/failures.dart';
import '../../../../../core/bloc/usecases/usecase.dart';

import '../../../../core/entities/studio.dart';
import '../repositories/favorite_repository.dart';

class EditWishListUseCase extends UseCase<List<Studio>, EditParams> {
  final FavoriteRepository _favoriteRepository;

  EditWishListUseCase({required FavoriteRepository favoriteRepository})
      : _favoriteRepository = favoriteRepository;

  @override
  Future<Either<Failure, List<Studio>>> call(params) =>
      _favoriteRepository.editWishList(params.id, params.delete);
}

class EditParams {
  final String id;
  final bool delete;

  EditParams({required this.id, required this.delete});
}
