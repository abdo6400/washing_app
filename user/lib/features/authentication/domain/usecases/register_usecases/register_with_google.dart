import 'package:dartz/dartz.dart';
import '../../../../../config/database/error/failures.dart';
import '../../../../../core/bloc/usecases/usecase.dart';
import '../../entities/auth.dart';
import '../../repositories/register_repository.dart';

class RegisterWithGoogleUseCase extends UseCase<Auth, NoParams> {
  final RegisterRepository _registerRepository;

  RegisterWithGoogleUseCase({required RegisterRepository registerRepository})
      : _registerRepository = registerRepository;
  @override
  Future<Either<Failure, Auth>> call(params) =>
      _registerRepository.registerWithGoogle();
}
