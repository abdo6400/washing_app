import '../../domain/entities/category.dart';

class CategoryModel extends Category {
  CategoryModel({
    required super.type,
    required super.id,
    required super.logo,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        type: json["type"],
        id: json["id"],
        logo: json["logo"],
      );
}
