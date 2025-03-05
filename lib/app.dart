import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moein_moradi/config/assets/fonts.dart';
import 'package:moein_moradi/core/dependencies/locator.dart';
import 'package:moein_moradi/core/router/app_router.dart';
import 'package:moein_moradi/features/home/presentation/bloc/home_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (homeContext) => locator<HomeBloc>(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        title: 'Moein Moradi',
        theme: ThemeData(
          fontFamily: AppFonts.sfPro,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}
