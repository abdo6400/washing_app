import 'package:bloc/bloc.dart';
import 'package:car_washing/core/bloc/usecases/usecase.dart';
import 'package:car_washing/features/favorite/domain/usecases/get_wish_list_usecase.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/entities/studio.dart';
import '../../domain/usecases/edit_wish_list_usecase.dart';
part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final GetWishListUseCase _getWishListUseCase;
  final EditWishListUseCase _editWishListUseCase;
  List<String> favoriteItems = [];
  FavoriteCubit(
      {required GetWishListUseCase getWishListUseCase,
      required EditWishListUseCase editWishListUseCase})
      : _getWishListUseCase = getWishListUseCase,
        _editWishListUseCase = editWishListUseCase,
        super(FavoriteInitial());
  void getFavoriteIds(List<Studio> studios) {
    List<String> items = [];
    for (var element in studios) {
      if (!items.contains(element.id)) {
        items.add(element.id);
      }
    }
    favoriteItems = items;
  }

  Future<void> getFavoriteData() async {
    emit(FavoriteDataLoadingState());
    emit(await _getWishListUseCase.call(NoParams()).then((value) =>
        value.fold((l) => FavoriteDataErrorState(l.errorMessage), (r) {
          getFavoriteIds(r);
          return FavoriteDataLoadedState(r);
        })));
  }

  Future<void> editFavoriteData(String id, bool delete) async {
    emit(FavoriteEditDataLoadingState());
    emit(await _editWishListUseCase
        .call(EditParams(id: id, delete: delete))
        .then((value) =>
            value.fold((l) => FavoriteDataErrorState(l.errorMessage), (r) {
              getFavoriteIds(r);
              return FavoriteDataLoadedState(r);
            })));
  }

  void editFavorite(String propertyId) {
    if (favoriteItems.contains(propertyId)) {
      favoriteItems.remove(propertyId);
      editFavoriteData(propertyId, false);
    } else {
      favoriteItems.add(propertyId);
      editFavoriteData(propertyId, true);
    }
  }
}
