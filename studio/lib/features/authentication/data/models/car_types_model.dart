import '../../domain/entities/services.dart';

class ServicesModel extends Services {
  ServicesModel({required super.message, required super.results});

  factory ServicesModel.fromJson(Map<String, dynamic> json) => ServicesModel(
        message: json["message"],
        results: ResultsModel.fromJson(json["results"]),
      );
}

class ResultsModel extends Results {
  ResultsModel({required super.services});

  factory ResultsModel.fromJson(Map<String, dynamic> json) => ResultsModel(
        services: List<Service>.from(
            json["services"].map((x) => ServiceModel.fromJson(x))),
      );
}

class ServiceModel extends Service {
  ServiceModel({required super.type, required super.id});

  factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
        type: json["type"],
        id: json["id"],
      );
}
