part of 'studios_cubit.dart';

sealed class StudiosState extends Equatable {
  const StudiosState();

  @override
  List<Object> get props => [];
}

final class StudiosInitial extends StudiosState {}

class ServicesLoadingState extends StudiosState {}

class ServicesErrorState extends StudiosState {
  final String msg;

  const ServicesErrorState(this.msg);
}

class ServicesLoadedState extends StudiosState {
  final List<Studio> studios;

  const ServicesLoadedState(this.studios);
}
