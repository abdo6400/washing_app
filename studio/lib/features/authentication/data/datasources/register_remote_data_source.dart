import '../../../../config/database/api/api_consumer.dart';
import '../../../../config/database/api/end_points.dart';
import '../../../../core/utils/commons.dart';
import '../models/auth_model.dart';
import '../models/car_types_model.dart';
import '../models/register_params_model.dart';

abstract class RegisterRemoteDataSource {
  Future<AuthModel> register(RegisterParamsModel registerParamsModel);
  Future<AuthModel> registerWithGoogle();
  Future<AuthModel> checkEmail(String email);
  Future<AuthModel> verifyEmail(String code, String secureKey);
  Future<AuthModel> resendCode(String email);
  Future<ServicesModel> getServices();
}

class RegisterRemoteDataSourceImpl extends RegisterRemoteDataSource {
  final ApiConsumer _apiConsumer;

  RegisterRemoteDataSourceImpl({required ApiConsumer apiConsumer})
      : _apiConsumer = apiConsumer;

  @override
  Future<AuthModel> checkEmail(String email) async {
    final response = await _apiConsumer
        .post(EndPoints.checkEmail, body: {ApiKeys.email: email});
    return AuthModel.fromJson(response);
  }

  @override
  Future<AuthModel> register(RegisterParamsModel registerParamsModel) async {
    final Map<String, dynamic> body = {
      'logo': await multipartConvertImage(image: registerParamsModel.logo),
      'name': registerParamsModel.name,
      'phone': registerParamsModel.phone,
      'email': registerParamsModel.email,
      'password': registerParamsModel.password,
      'location': registerParamsModel.location,
      'services': registerParamsModel.services,
      'description': registerParamsModel.description,
      'openTime': registerParamsModel.openTime,
      'closeTime': registerParamsModel.closeTime,
    };

    final response = await _apiConsumer.post(EndPoints.register,
        name: "studio_images",
        body: body,
        files: registerParamsModel.studioImages);
    return AuthModel.fromJson(response);
  }

  @override
  Future<AuthModel> registerWithGoogle() async {
    // TODO: implement registerWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<AuthModel> resendCode(String email) async {
    final response = await _apiConsumer
        .post(EndPoints.resendCode, body: {ApiKeys.email: email});
    return AuthModel.fromJson(response);
  }

  @override
  Future<AuthModel> verifyEmail(String code, String secureKey) async {
    final response = await _apiConsumer.post(EndPoints.verifyEmail,
        body: {ApiKeys.otpSecret: secureKey, ApiKeys.token: code});
    return AuthModel.fromJson(response);
  }

  @override
  Future<ServicesModel> getServices() async {
    final response = await _apiConsumer.get(
      EndPoints.services,
    );
    return ServicesModel.fromJson(response);
  }
}
