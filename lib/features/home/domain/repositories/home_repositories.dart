import 'package:moein_moradi/core/models/data_state.dart';
import 'package:moein_moradi/core/models/user/user_profile_model.dart';

abstract class HomeRepositories {
  Future<DataState<UserProfileModel>> getUserProfile();
}
