import '../../../../config/database/api/api_consumer.dart';
import '../../../../config/database/api/end_points.dart';
import '../models/user_model.dart';

abstract class ProfileRemoteDataSource {
  Future<UserModel> getUser();
}

class ProfileRemoteDataSourceImpl extends ProfileRemoteDataSource {
  final ApiConsumer _apiConsumer;

  ProfileRemoteDataSourceImpl({required ApiConsumer apiConsumer})
      : _apiConsumer = apiConsumer;
  @override
  Future<UserModel> getUser() async {
    final response = await _apiConsumer.get(
      EndPoints.user,
    );
    return UserModel.fromJson(response);
  }
}
