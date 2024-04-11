import '../../domain/entities/user.dart';

class UserModel extends User {
  UserModel({required super.message, required UserClassModel super.results});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        message: json["message"],
        results: UserClassModel.fromJson(json["results"]["user"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "results": results,
      };
}

class UserClassModel extends UserClass {
  UserClassModel(
      {required super.logo,
      required super.name,
      required super.phone,
      required super.location,
      required super.vehicleType,
      required super.brand,
      required super.model,
      required super.carPlate,
      required super.carColor,
      required super.carImages,
      required super.id,
      required super.emailAddress});

  factory UserClassModel.fromJson(Map<String, dynamic> json) => UserClassModel(
        logo: json["logo"],
        name: json["name"],
        phone: json["phone"],
        location: json["location"]["coordinates"],
        vehicleType: json["vehicleType"],
        brand: json["brand"],
        model: json["model"],
        carPlate: json["carPlate"],
        carColor: json["carColor"],
        carImages: List<String>.from(json["car_images"].map((x) => x)),
        id: json["id"],
        emailAddress: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "logo": logo,
        "name": name,
        "phone": phone,
        "location": location,
        "vehicleType": vehicleType,
        "brand": brand,
        "model": model,
        "carPlate": carPlate,
        "carColor": carColor,
        "car_images": List<dynamic>.from(carImages.map((x) => x)),
        "id": id,
      };
}
