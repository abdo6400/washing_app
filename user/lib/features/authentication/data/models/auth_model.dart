import '../../domain/entities/auth.dart';

class AuthModel extends Auth {
  AuthModel({required super.token, required super.message});
  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
      message: json["message"],
      token: json["results"] != null ? json["results"]["token"] : "");
}
