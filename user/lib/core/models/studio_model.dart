

import '../entities/studio.dart';

class StudioModel extends Studio {
  StudioModel({
    required super.location,
    required super.logo,
    required super.name,
    required super.phone,
    required super.description,
    required super.openTime,
    required super.closeTime,
    required super.services,
    required super.studioImages,
    required super.ratingsAvg,
    required super.id,
  });

  factory StudioModel.fromJson(Map<String, dynamic> json) => StudioModel(
        location: List<double>.from(
            json["location"]["coordinates"].map((x) => x?.toDouble())),
        logo: json["logo"],
        name: json["name"],
        phone: json["phone"],
        description: json["description"],
        openTime: json["openTime"],
        closeTime: json["closeTime"],
        services: List<Service>.from(
            json["services"].map((x) => ServiceModel.fromJson(x))),
        studioImages: List<String>.from(json["studio_images"].map((x) => x)),
        ratingsAvg: double.parse(json["ratingsAvg"].toString()),
        id: json["id"],
      );
}

class ServiceModel extends Service {
  ServiceModel(
      {required super.type,
      required super.id,
      required super.logo,
      required super.price});

  factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
      type: json["service"]["type"],
      id: json["service"]["id"],
      logo: json["service"]["logo"],
      price: json["price"].toString());
}
