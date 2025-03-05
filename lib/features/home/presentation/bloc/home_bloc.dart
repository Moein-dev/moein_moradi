import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:moein_moradi/core/models/data_state.dart';
import 'package:moein_moradi/core/models/state_status.dart';
import 'package:moein_moradi/core/models/user/user_profile_model.dart';
import 'package:moein_moradi/core/network/status_handler.dart';
import 'package:moein_moradi/features/home/domain/usecases/get_user_profile_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetUserProfileUsecase userProfileUsecase;
  HomeBloc({
    required this.userProfileUsecase,
  }) : super(
          const HomeState(
            userProfileStatus: StateInitial(),
          ),
        ) {
    on<GetUserProfileEvent>((event, emit) async {
      DataState<UserProfileModel> result = await userProfileUsecase();

      return emit(
        state.copyWith(
          newUserProfileStatus: StatusHandler.getStatus(result),
        ),
      );
    });
  }
}
