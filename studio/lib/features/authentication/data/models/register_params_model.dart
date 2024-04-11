import 'package:image_picker/image_picker.dart';

class RegisterParamsModel {
  final XFile logo;
  final String name;
  final String phone;
  final String email;
  final String password;
  final String location;
  final List<Map<String,String>> services;
  final List<XFile> studioImages;
  final String description;
  final String openTime;
  final String closeTime;

  RegisterParamsModel(
      {required this.logo,
      required this.name,
      required this.phone,
      required this.email,
      required this.password,
      required this.location,
      required this.services,
      required this.studioImages,
      required this.description,
      required this.openTime,
      required this.closeTime,
      });
}
