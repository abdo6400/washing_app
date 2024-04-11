import 'package:bloc/bloc.dart';
import 'package:car_washing/features/home/domain/usecases/get_popular_studios_usecase.dart';
import 'package:car_washing/features/home/domain/usecases/get_services_usecase.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/bloc/usecases/usecase.dart';
import '../../../../core/entities/studio.dart';
import '../../domain/entities/category.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetServicesUseCase _getServicesUseCase;
  final GetPopularStudiosUseCase _getPopularStudiosUseCase;

  HomeCubit({
    required GetServicesUseCase getServicesUseCase,
    required GetPopularStudiosUseCase getPopularStudiosUseCase,
  })  : _getServicesUseCase = getServicesUseCase,
        _getPopularStudiosUseCase = getPopularStudiosUseCase,
        super(HomeInitial());

  Future<void> getHomeData() async {
    emit(HomeDataLoadingState());
    emit(await _getPopularStudiosUseCase.call(NoParams()).then((value) =>
        value.fold((l) => HomeDataErrorState(l.errorMessage), (studios) {
          return _getServicesUseCase.call(NoParams()).then(
                (value) => value.fold((l) => HomeDataErrorState(l.errorMessage),
                    (services) => HomeDataLoadedState(studios, services)),
              );
        })));
  }
}
