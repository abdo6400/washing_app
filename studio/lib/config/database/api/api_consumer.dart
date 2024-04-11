import 'package:image_picker/image_picker.dart';

abstract class ApiConsumer {
  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  });

  Future<dynamic> post(
    String path, {
    Map<String, dynamic>? body,
    bool formDataIsEnabled = true,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    String? name,
    List<XFile> ?files 
  });

  Future<dynamic> delete(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  });

  Future<dynamic> patch(
    String path, {
    Map<String, dynamic>? body,
    bool formDataIsEnabled = true,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  });

  Future<dynamic> put(
    String path, {
    Map<String, dynamic>? body,
    bool formDataIsEnabled = true,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  });
  Future<dynamic> download(
    String path,
    String savePath, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  });
}
