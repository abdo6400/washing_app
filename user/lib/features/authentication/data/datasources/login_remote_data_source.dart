import 'package:car_washing/config/database/api/api_consumer.dart';
import 'package:car_washing/config/database/api/end_points.dart';

import '../models/auth_model.dart';

abstract class LoginRemoteDataSource {
  Future<AuthModel> login(String email, String password);
  Future<AuthModel> loginWithGoogle();
}

class LoginRemoteDataSourceImpl extends LoginRemoteDataSource {
  final ApiConsumer _apiConsumer;

  LoginRemoteDataSourceImpl({required ApiConsumer apiConsumer})
      : _apiConsumer = apiConsumer;

  @override
  Future<AuthModel> login(String email, String password) async {
    final response = await _apiConsumer.post(EndPoints.login,
        body: {ApiKeys.email: email, ApiKeys.password: password});

    return AuthModel.fromJson(response);
  }

  @override
  Future<AuthModel> loginWithGoogle() {
    // TODO: implement loginWithGoogle
    throw UnimplementedError();
  }
}
