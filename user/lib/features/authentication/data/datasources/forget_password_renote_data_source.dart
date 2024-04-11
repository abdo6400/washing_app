import '../../../../config/database/api/api_consumer.dart';
import '../../../../config/database/api/end_points.dart';
import '../models/auth_model.dart';

abstract class ForgetPasswordRemoteDataSource {
  Future<AuthModel> forgetPassword(String email);
  Future<AuthModel> resetPassword(
      String email, String newPassword, String confirmNewPassword);
  Future<AuthModel> verifyEmail(String code, String secureKey);
  Future<AuthModel> resendCode(String email);
}

class ForgetPasswordRemoteDataSourceImpl
    extends ForgetPasswordRemoteDataSource {
  final ApiConsumer _apiConsumer;

  ForgetPasswordRemoteDataSourceImpl({required ApiConsumer apiConsumer})
      : _apiConsumer = apiConsumer;
  @override
  Future<AuthModel> forgetPassword(String email) async {
    final response = await _apiConsumer
        .post(EndPoints.forgetPassword, body: {ApiKeys.email: email});
    return AuthModel.fromJson(response);
  }

  @override
  Future<AuthModel> resendCode(String email) async {
    final response = await _apiConsumer
        .post(EndPoints.resendCode, body: {ApiKeys.email: email});
    return AuthModel.fromJson(response);
  }

  @override
  Future<AuthModel> resetPassword(
      String email, String newPassword, String confirmNewPassword) async {
    final response = await _apiConsumer.post(EndPoints.resetPassword, body: {
      ApiKeys.email: email,
      ApiKeys.newPassword: newPassword,
      ApiKeys.confirmPassword: confirmNewPassword
    });
    return AuthModel.fromJson(response);
  }

  @override
  Future<AuthModel> verifyEmail(String code, String secureKey) async {
    final response = await _apiConsumer.post(EndPoints.verifyEmail,
        body: {ApiKeys.otpSecret: secureKey, ApiKeys.token: code});
    return AuthModel.fromJson(response);
  }
}
