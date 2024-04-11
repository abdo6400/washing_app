class User {
  final String message;
  final UserClass results;

  User({
    required this.message,
    required this.results,
  });
}

class UserClass {
  final String logo;
  final String name;
  final String phone;
  final List<dynamic> location;
  final String vehicleType;
  final String brand;
  final String model;
  final String carPlate;
  final String carColor;
  final String emailAddress;
  final List<String> carImages;
  final String id;

  UserClass({
    required this.logo,
    required this.name,
    required this.phone,
    required this.location,
    required this.vehicleType,
    required this.brand,
    required this.model,
    required this.carPlate,
    required this.carColor,
    required this.carImages,
    required this.id,
    required this.emailAddress,
  });
}
