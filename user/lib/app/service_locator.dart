import 'package:car_washing/features/authentication/domain/usecases/register_usecases/get_car_types_usecase.dart';
import 'package:car_washing/features/favorite/data/datasources/favorite_remote_data_source.dart';
import 'package:car_washing/features/favorite/data/repositories/favorite_repository_impl.dart';
import 'package:car_washing/features/favorite/domain/repositories/favorite_repository.dart';
import 'package:car_washing/features/favorite/domain/usecases/edit_wish_list_usecase.dart';
import 'package:car_washing/features/favorite/domain/usecases/get_wish_list_usecase.dart';
import 'package:car_washing/features/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:car_washing/features/home/data/datasources/home_remote_data_source.dart';
import 'package:car_washing/features/home/data/repositories/home_repository_impl.dart';
import 'package:car_washing/features/home/domain/repositories/home_repository.dart';
import 'package:car_washing/features/home/domain/usecases/get_popular_studios_usecase.dart';
import 'package:car_washing/features/home/domain/usecases/get_services_usecase.dart';
import 'package:car_washing/features/home/domain/usecases/get_studios_usecase.dart';
import 'package:car_washing/features/home/presentation/cubit/home_cubit.dart';
import 'package:car_washing/features/home/presentation/cubit/studios_cubit.dart';
import 'package:car_washing/features/main/presentation/cubit/main_cubit.dart';
import 'package:car_washing/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:car_washing/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:car_washing/features/profile/domain/repositories/profile_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../config/database/api/api_consumer.dart';
import '../config/database/api/app_interceptors.dart';
import '../config/database/api/dio_consumer.dart';
import '../config/database/cache/cache_helper.dart';
import '../config/database/network/netwok_info.dart';
import '../core/components/map/presentation/cubit/map_cubit.dart';
import '../core/utils/google_mpas_tools.dart';
import '../features/authentication/data/datasources/forget_password_renote_data_source.dart';
import '../features/authentication/data/datasources/login_remote_data_source.dart';
import '../features/authentication/data/datasources/register_remote_data_source.dart';
import '../features/authentication/data/repositories/forget_password_repository_impl.dart';
import '../features/authentication/data/repositories/login_repository_impl.dart';
import '../features/authentication/data/repositories/register_repository_impl.dart';
import '../features/authentication/domain/repositories/forget_password_repository.dart';
import '../features/authentication/domain/repositories/login_repository.dart';
import '../features/authentication/domain/repositories/register_repository.dart';
import '../features/authentication/domain/usecases/forget_password_usecases/forget_password_usecase.dart';
import '../features/authentication/domain/usecases/forget_password_usecases/forget_resend_code_usecase.dart';
import '../features/authentication/domain/usecases/forget_password_usecases/forget_verify_email_usecase.dart';
import '../features/authentication/domain/usecases/forget_password_usecases/reset_password_usecase.dart';
import '../features/authentication/domain/usecases/login_usecases/login_usecase.dart';
import '../features/authentication/domain/usecases/login_usecases/login_with_google_usecase.dart';
import '../features/authentication/domain/usecases/register_usecases/check_email_usecase.dart';
import '../features/authentication/domain/usecases/register_usecases/register_usecase.dart';
import '../features/authentication/domain/usecases/register_usecases/register_with_google.dart';
import '../features/authentication/domain/usecases/register_usecases/resend_code_usecase.dart';
import '../features/authentication/domain/usecases/register_usecases/verfiy_email_usecase.dart';
import '../features/authentication/presentation/cubit/authentication_cubit.dart';
import '../features/profile/domain/usecases/get_user_usecase.dart';
import '../features/profile/presentation/cubit/profile_cubit.dart';
import '../features/start/cubit/onboarding_cubit.dart';
import '/core/bloc/global_cubit/locale_cubit.dart';
import '/core/bloc/global_cubit/theme_cubit.dart';

final sl = GetIt.instance;

Future<void> serviceLocatorInit() async {
  await _authInit();
  await _app();
  //External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<CacheHelper>(() => CacheHelper(sharedPreferences));
  sl.registerLazySingleton(() => InternetConnectionChecker());

  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton<LocaleCubit>(() => LocaleCubit());
  sl.registerLazySingleton<MainCubit>(() => MainCubit());
  sl.registerLazySingleton<ThemeCubit>(() => ThemeCubit());
  sl.registerLazySingleton<MapCubit>(() => MapCubit());
  sl.registerLazySingleton<OnboardingCubit>(() => OnboardingCubit());
  sl.registerLazySingleton<ApiConsumer>(
      () => DioConsumer(client: sl(), networkInfo: sl()));
  sl.registerLazySingleton(() => LogInterceptor(
      responseBody: true,
      error: true,
      requestHeader: true,
      responseHeader: true,
      request: true,
      requestBody: true));
  sl.registerLazySingleton(() => AppIntercepters(
        client: sl(),
      ));
  //google maps tools
  sl.registerLazySingleton(() => GoogleMapsTools());
}

Future<void> _authInit() async {
  //! Blocs or cubits
  sl.registerLazySingleton<AuthenticationCubit>(() => AuthenticationCubit(
      loginUseCase: sl(),
      forgetPasswordUseCase: sl(),
      resetPasswordUseCase: sl(),
      checkEmailUseCase: sl(),
      verfiyEmailUseCase: sl(),
      registerUseCase: sl(),
      forgetPasswordVerifyEmailUseCase: sl(),
      forgetPasswordResendCodeUseCase: sl(),
      resendCodeUseCase: sl(),
      registerWithGoogleUseCase: sl(),
      loginWithGoogleUseCase: sl(),
      getCarTypesUseCase: sl()));
  //! Use cases
  sl.registerLazySingleton(() => LoginUseCase(loginRepository: sl()));
  sl.registerLazySingleton(() => RegisterUseCase(registerRepository: sl()));
  sl.registerLazySingleton(() => GetCarTypesUseCase(registerRepository: sl()));
  sl.registerLazySingleton(
      () => ForgetPasswordUseCase(forgetPasswordRepository: sl()));
  sl.registerLazySingleton(
      () => ResetPasswordUseCase(forgetPasswordRepository: sl()));
  sl.registerLazySingleton(() => CheckEmailUseCase(registerRepository: sl()));
  sl.registerLazySingleton(() => VerfiyEmailUseCase(registerRepository: sl()));
  sl.registerLazySingleton(() => ResendCodeUseCase(registerRepository: sl()));
  sl.registerLazySingleton(
      () => ForgetPasswordVerifyEmailUseCase(forgetPasswordRepository: sl()));
  sl.registerLazySingleton(
      () => ForgetPasswordResendCodeUseCase(forgetPasswordRepository: sl()));
  sl.registerLazySingleton(() => LoginWithGoogleUseCase(loginRepository: sl()));
  sl.registerLazySingleton(
      () => RegisterWithGoogleUseCase(registerRepository: sl()));
  //! repositories
  sl.registerLazySingleton<ForgetPasswordRepository>(
      () => ForgetPasswordRepositoryImpl(forgetPasswordRemoteDataSource: sl()));
  sl.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(loginRemoteDataSource: sl()));
  sl.registerLazySingleton<RegisterRepository>(
      () => RegisterRepositoryImpl(registerRemoteDataSource: sl()));
  //! Data sources
  sl.registerLazySingleton<ForgetPasswordRemoteDataSource>(
      () => ForgetPasswordRemoteDataSourceImpl(apiConsumer: sl()));
  sl.registerLazySingleton<LoginRemoteDataSource>(
      () => LoginRemoteDataSourceImpl(apiConsumer: sl()));
  sl.registerLazySingleton<RegisterRemoteDataSource>(
      () => RegisterRemoteDataSourceImpl(apiConsumer: sl()));
}

Future<void> _app() async {
  //! Blocs or cubits
  sl.registerLazySingleton(() => ProfileCubit(getUserUseCase: sl()));
  sl.registerLazySingleton(
      () => FavoriteCubit(getWishListUseCase: sl(), editWishListUseCase: sl()));
  sl.registerLazySingleton(() => HomeCubit(
        getServicesUseCase: sl(),
        getPopularStudiosUseCase: sl(),
      ));
  sl.registerLazySingleton(() => StudiosCubit(getStudiosUseCase: sl()));
  //! Use cases
  sl.registerLazySingleton(() => GetWishListUseCase(favoriteRepository: sl()));
  sl.registerLazySingleton(() => GetUserUseCase(profileRepository: sl()));
  sl.registerLazySingleton(() => EditWishListUseCase(favoriteRepository: sl()));
  sl.registerLazySingleton(() => GetServicesUseCase(homeRepository: sl()));
  sl.registerLazySingleton(
      () => GetPopularStudiosUseCase(homeRepository: sl()));
  sl.registerLazySingleton(() => GetStudiosUseCase(homeRepository: sl()));
  //! repositories
  sl.registerLazySingleton<FavoriteRepository>(
      () => FavoriteRepositoryImpl(favoriteRemoteDataSource: sl()));
  sl.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(homeRemoteDataSource: sl()));
  sl.registerLazySingleton<ProfileRepository>(
      () => ProfileRepositoryImpl(profileRemoteDataSource: sl()));
  //! Data sources
  sl.registerLazySingleton<FavoriteRemoteDataSource>(
      () => FavoriteRemoteDataSourceImpl(apiConsumer: sl()));
  sl.registerLazySingleton<ProfileRemoteDataSource>(
      () => ProfileRemoteDataSourceImpl(apiConsumer: sl()));
  sl.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(apiConsumer: sl()));
}
