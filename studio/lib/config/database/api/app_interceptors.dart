import 'dart:io';

import 'package:dio/dio.dart';
import '../../../app/service_locator.dart';
import '../../../core/utils/app_enums.dart';
import '../../../core/utils/custom_print.dart';
import '../cache/cache_helper.dart';
import 'end_points.dart';

class AppIntercepters extends Interceptor {
  final Dio client;
  // final LangLocalDataSource langLocalDataSource;
  // final AuthLocalDataSource authLocalDataSource;
  AppIntercepters(
      {
      // required this.langLocalDataSource,
      // required this.authLocalDataSource,
      required this.client});

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers[HttpHeaders.acceptHeader] = ContentType.json;
    options.headers['authorization'] = sl<CacheHelper>()
                .getData(key: MySharedKeys.apiToken.name) !=
            null
        ? '${EndPoints.prefixToken} ${sl<CacheHelper>().getData(key: MySharedKeys.apiToken.name)}'
        : null;
    options.queryParameters['ln'] = sl<CacheHelper>().getCachedLanguage();
 
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    CustomPrint.printFullText(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    super.onResponse(response, handler);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    CustomPrint.printFullText(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    super.onError(err, handler);
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return client.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }

  // Future<bool> _refreshToken(UserModel authenticatedUser) async {
  // final response = await client.post(EndPoints.refreshToken, data: {
  //   AppStrings.token: authenticatedUser.token,
  //   AppStrings.refreshToken: authenticatedUser.refreshToken,
  // });
  // final jsonResponse = Commons.decodeJson(response);
  // BaseResponseModel baseResponse = BaseResponseModel.fromJson(jsonResponse);
  // if (baseResponse.isSuccess!) {
  //   authenticatedUser.token = baseResponse.data["token"];
  //   authenticatedUser.refreshToken = baseResponse.data["refreshToken"];
  //   authLocalDataSource.saveLoginCredentials(userModel: authenticatedUser);
  //   return true;
  // } else {
  //   return false;
  // }
  // }
}
