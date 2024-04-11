import 'package:car_washing/config/database/api/api_consumer.dart';
import 'package:car_washing/config/database/api/end_points.dart';

import '../../../../core/models/studio_model.dart';
import '../models/category_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<StudioModel>> getPopularStudios();
  Future<List<StudioModel>> getStudios(String id);
  Future<List<CategoryModel>> getServices();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiConsumer _apiConsumer;

  HomeRemoteDataSourceImpl({required ApiConsumer apiConsumer})
      : _apiConsumer = apiConsumer;
  @override
  Future<List<StudioModel>> getPopularStudios() async {
    final response = await _apiConsumer.get(EndPoints.popularStudios);

    return List<StudioModel>.from(
        response["results"]["studios"].map((x) => StudioModel.fromJson(x)));
  }

  @override
  Future<List<CategoryModel>> getServices() async {
    final response = await _apiConsumer.get(EndPoints.services);

    return List<CategoryModel>.from(
        response["results"]["services"].map((x) => CategoryModel.fromJson(x)));
  }

  @override
  Future<List<StudioModel>> getStudios(String id) async {
    final response = await _apiConsumer.get("${EndPoints.getStudios}/$id");

    return List<StudioModel>.from(
        response["results"]["studios"].map((x) => StudioModel.fromJson(x)));
  }
}
