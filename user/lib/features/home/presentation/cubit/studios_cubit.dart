import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';


import '../../../../core/entities/studio.dart';
import '../../domain/usecases/get_studios_usecase.dart';

part 'studios_state.dart';

class StudiosCubit extends Cubit<StudiosState> {
  final GetStudiosUseCase _getStudiosUseCase;
  StudiosCubit({required GetStudiosUseCase getStudiosUseCase})
      : _getStudiosUseCase = getStudiosUseCase,
        super(StudiosInitial());

  Future<void> getStudios(String id) async {
    emit(ServicesLoadingState());
    emit(await _getStudiosUseCase.call(id).then((value) =>
        value.fold((l) => ServicesErrorState(l.errorMessage), (studios) {
          return ServicesLoadedState(studios);
        })));
  }
}
