import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());
  final ZoomDrawerController drawerController = ZoomDrawerController();
  int page = 0;

  void changePage(int page) {
    emit(MainInitial());
    this.page = page;
    emit(MainPageChanged());
  }
}
