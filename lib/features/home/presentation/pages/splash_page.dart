import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:moein_moradi/config/assets/fonts.dart';
import 'package:moein_moradi/config/assets/images.dart';
import 'package:moein_moradi/core/dependencies/locator.dart';
import 'package:moein_moradi/core/global/app_global.dart';
import 'package:moein_moradi/core/models/image_model.dart';
import 'package:moein_moradi/core/models/state_status.dart';
import 'package:moein_moradi/core/network/status_handler.dart';
import 'package:moein_moradi/core/router/app_router.dart';
import 'package:moein_moradi/core/widgets/image_builder.dart';
import 'package:moein_moradi/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  static HomeBloc homeBloc = locator();

  Future<void> navToMain(BuildContext context) async {
    context.go(RouterKey.packages);
  }

  void initSplash() {
    if (homeBloc.state.userProfileStatus is StateInitial) {
      homeBloc.add(GetUserProfileEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    initSplash();
    return Scaffold(
      body: Center(
        child: BlocListener<HomeBloc, HomeState>(
          listener: (context, state) {
            StatusHandler.of(
              state.userProfileStatus,
              onCompleted: (data) {
                AppGlobal.userProfile = data;
                navToMain(context);
              },
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                decoration:
                    const BoxDecoration(shape: BoxShape.circle, boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 0), color: Colors.grey, blurRadius: 10),
                ]),
                child: ImageBuilder(
                  width: 200,
                  image: ImageModel(
                    local: AppImages.profile,
                  ),
                ),
              ).animate(
                onComplete: (controller) {
                  controller.repeat(reverse: true);
                },
              ).shimmer(
                duration: const Duration(milliseconds: 1500),
                curve: Curves.linearToEaseOut,
                size: 2,
              ),
              const Gap(60),
              Text(
                "Hi, I'm Moein Moradi.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 48,
                  fontFamily: AppFonts.sfPro,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
