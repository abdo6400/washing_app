part of 'favorite_cubit.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

class FavoriteInitial extends FavoriteState {}



class FavoriteDataLoadingState extends FavoriteState {}

class FavoriteEditDataLoadingState extends FavoriteState {}


class FavoriteDataErrorState extends FavoriteState {final String msg;

  const FavoriteDataErrorState(this.msg);}


class FavoriteDataLoadedState extends FavoriteState {final List<Studio> studios;

  const FavoriteDataLoadedState(this.studios);}
