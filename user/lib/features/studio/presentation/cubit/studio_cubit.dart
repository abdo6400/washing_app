import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'studio_state.dart';

class StudioCubit extends Cubit<StudioState> {
  StudioCubit() : super(StudioInitial());
}
