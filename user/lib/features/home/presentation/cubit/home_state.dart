part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeDataLoadingState extends HomeState {}

class HomeDataErrorState extends HomeState {
  final String msg;

  const HomeDataErrorState(this.msg);
}

class HomeDataLoadedState extends HomeState {
  final List<Studio> studios;
  final List<Category> services;
  const HomeDataLoadedState(this.studios, this.services);
}
