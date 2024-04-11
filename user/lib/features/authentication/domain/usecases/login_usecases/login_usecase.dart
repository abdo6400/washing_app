import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../config/database/error/failures.dart';
import '../../../../../core/bloc/usecases/usecase.dart';
import '../../entities/auth.dart';
import '../../repositories/login_repository.dart';

class LoginUseCase extends UseCase<Auth, LoginParams> {
  final LoginRepository _loginRepository;

  LoginUseCase({required LoginRepository loginRepository})
      : _loginRepository = loginRepository;
  @override
  Future<Either<Failure, Auth>> call(params) =>
      _loginRepository.login(email: params.email, password: params.password);
}

class LoginParams extends Equatable {
  final String email;
  final String password;
  const LoginParams({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
