import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/bloc/usecases/usecase.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/get_user_usecase.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetUserUseCase _getUserUseCase;
  ProfileCubit({required GetUserUseCase getUserUseCase})
      : _getUserUseCase = getUserUseCase,
        super(ProfileInitial());

  Future<void> getUser() async {
    emit(UserLoadingState());

    emit(await _getUserUseCase.call(NoParams()).then((value) => value.fold(
        (l) => UserErrorstate(l.errorMessage), (r) => UserLoadedState(r))));
  }
}
