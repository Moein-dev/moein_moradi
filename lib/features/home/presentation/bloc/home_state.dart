part of 'home_bloc.dart';

class HomeState extends Equatable {
  final StateStatus<UserProfileModel> userProfileStatus;
  const HomeState({
    required this.userProfileStatus,
  });

  @override
  List<Object> get props => [
        userProfileStatus,
      ];

  HomeState copyWith({
    StateStatus<UserProfileModel>? newUserProfileStatus,
  }) {
    return HomeState(
        userProfileStatus: newUserProfileStatus ?? userProfileStatus);
  }
}
