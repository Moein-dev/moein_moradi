import 'package:flutter/material.dart';

class AppBottomTabBar extends StatelessWidget {
  final Widget child;
  const AppBottomTabBar({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(child:child);
  }
}
