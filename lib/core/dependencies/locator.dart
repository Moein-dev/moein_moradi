import 'package:get_it/get_it.dart';
import 'package:moein_moradi/core/global/app_global.dart';
import 'package:moein_moradi/features/home/data/datasources/home_api_provider.dart';
import 'package:moein_moradi/features/home/data/repositories/home_repositories_lmpl.dart';
import 'package:moein_moradi/features/home/domain/repositories/home_repositories.dart';
import 'package:moein_moradi/features/home/domain/usecases/get_user_profile_usecase.dart';
import 'package:moein_moradi/features/home/presentation/bloc/home_bloc.dart';

GetIt locator = GetIt.instance;

setup() {
  /// app global
  locator.registerSingleton<AppGlobal>(AppGlobal());

  /// providers
  locator.registerSingleton<HomeApiProvider>(HomeApiProvider());

  /// repositories
  locator.registerSingleton<HomeRepositories>(
      HomeRepositoriesImpl(apiProvider: locator()));

  /// usecases
  locator.registerSingleton<GetUserProfileUsecase>(
      GetUserProfileUsecase(repositories: locator()));

  /// state managements
  locator.registerSingleton<HomeBloc>(HomeBloc(
    userProfileUsecase: locator(),
  ));
}
