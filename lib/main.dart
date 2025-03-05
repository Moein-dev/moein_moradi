import 'package:flutter/material.dart';
import 'package:moein_moradi/app.dart';
import 'package:moein_moradi/core/dependencies/locator.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initial service locator
  await setup();

  setPathUrlStrategy();

  // run App
  runApp(const App());
}
