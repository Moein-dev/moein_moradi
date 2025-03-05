import 'package:flutter/material.dart';
import 'package:moein_moradi/core/models/user/user_profile_model.dart';

class AppGlobal {
  static String themeMode = "light";
  static final GlobalKey<NavigatorState> bottomNavKey =
      GlobalKey<NavigatorState>(debugLabel: 'navigation key');
  static final GlobalKey<NavigatorState> mainKey =
      GlobalKey<NavigatorState>(debugLabel: 'main key');

  static UserProfileModel userProfile = UserProfileModel();
}
