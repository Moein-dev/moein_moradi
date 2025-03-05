import 'package:moein_moradi/core/models/data_state.dart';
import 'package:moein_moradi/core/models/user/user_profile_model.dart';
import 'package:moein_moradi/features/home/domain/repositories/home_repositories.dart';

class GetUserProfileUsecase {
  final HomeRepositories repositories;

  GetUserProfileUsecase({required this.repositories});

  Future<DataState<UserProfileModel>> call() async {
    return await repositories.getUserProfile();
  }
}
