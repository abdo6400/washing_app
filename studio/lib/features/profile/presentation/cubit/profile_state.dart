part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class UserLoadingState extends ProfileState {}

class UserErrorstate extends ProfileState {
  final String msg;

  const UserErrorstate(this.msg);
}

class UserLoadedState extends ProfileState {
  final User user;

  const UserLoadedState(this.user);
}
