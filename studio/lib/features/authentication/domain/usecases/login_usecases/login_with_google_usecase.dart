import 'package:dartz/dartz.dart';
import '../../../../../config/database/error/failures.dart';
import '../../../../../core/bloc/usecases/usecase.dart';
import '../../entities/auth.dart';
import '../../repositories/login_repository.dart';

class LoginWithGoogleUseCase extends UseCase<Auth, NoParams> {
  final LoginRepository _loginRepository;

  LoginWithGoogleUseCase({required LoginRepository loginRepository})
      : _loginRepository = loginRepository;
  @override
  Future<Either<Failure, Auth>> call(params) =>
      _loginRepository.loginWithGoogle();
}
