import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';


part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());

  int page = 0;

  void changePage(int page) {
    emit(MainInitial());
    this.page = page;
    emit(MainPageChanged());
  }
}
