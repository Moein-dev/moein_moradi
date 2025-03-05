import 'package:moein_moradi/core/models/data_state.dart';
import 'package:moein_moradi/core/models/user/user_profile_model.dart';
import 'package:moein_moradi/features/home/data/datasources/home_api_provider.dart';
import 'package:moein_moradi/features/home/domain/repositories/home_repositories.dart';

class HomeRepositoriesImpl extends HomeRepositories {
  final HomeApiProvider apiProvider;

  HomeRepositoriesImpl({
    required this.apiProvider,
  });

  @override
  Future<DataState<UserProfileModel>> getUserProfile() async {
    DataState response = await apiProvider.getUserData();
    if (response is DataSuccess) {
      return DataSuccess(data: UserProfileModel.fromJson(response.data));
    } else {
      return DataFailed(error: response.error!);
    }
  }
}
