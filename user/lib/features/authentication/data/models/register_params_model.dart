
import 'package:image_picker/image_picker.dart';

class RegisterParamsModel {
  final XFile logo;
  final String name;
  final String phone;
  final String email;
  final String password;
  final String location;
  final String vehicleType;
  final List<XFile> carImages;
  final String brand;
  final String model;
  final String carPlate;
  final String carColor;

  RegisterParamsModel(
      {required this.logo,
      required this.name,
      required this.phone,
      required this.email,
      required this.password,
      required this.location,
      required this.vehicleType,
      required this.carImages,
      required this.brand,
      required this.model,
      required this.carPlate,
      required this.carColor});
}
