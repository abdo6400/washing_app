import 'package:car_washing/features/authentication/domain/entities/car_types.dart';

class CarTypesModel extends CarTypes {
  CarTypesModel({required super.message, required super.results});
  factory CarTypesModel.fromJson(Map<String, dynamic> json) => CarTypesModel(
        message: json["message"],
        results: ResultsModel.fromJson(json["results"]),
      );
}

class ResultsModel extends Results {
  ResultsModel({required super.cars});
  factory ResultsModel.fromJson(Map<String, dynamic> json) => ResultsModel(
        cars: List<Car>.from(json["cars"].map((x) => CarModel.fromJson(x))),
      );
}

class CarModel extends Car {
  CarModel(
      {required super.logo,
      required super.type,
      required super.brands,
      required super.id});
  factory CarModel.fromJson(Map<String, dynamic> json) => CarModel(
        logo: json["logo"],
        type: json["type"],
        brands:
            List<Brand>.from(json["brands"].map((x) => BrandModel.fromJson(x))),
        id: json["id"],
      );
}

class BrandModel extends Brand {
  BrandModel({required super.brandName, required super.models});
  factory BrandModel.fromJson(Map<String, dynamic> json) => BrandModel(
        brandName: json["brandName"],
        models:
            List<String>.from(json["models"].map((x) => x["name"])).toList(),
      );
}
