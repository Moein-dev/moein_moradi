import 'package:flutter/material.dart';

class AppTabBar extends StatelessWidget {
  final void Function(int index) onPressedTap;
  final int activeTab;
  const AppTabBar({
    super.key,
    required this.onPressedTap,
    this.activeTab = 0,
  });

  static List<String> tabBarItems = [
    "Packages",
    "Projects",
    "Skills",
    "Articles",
  ];

  @override
  Widget build(BuildContext context) {
    BorderRadius borderRadius = BorderRadius.circular(8);
    BorderRadius borderRadius2 = BorderRadius.circular(6);
    Color backgroundColor = const Color(0xfff1f1f1);
    return Container(
      width: 600,
      height: 44,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: backgroundColor,
        border: Border.all(
          color: Colors.black12,
        ),
      ),
      child: Row(
        children: List.generate(
          4,
          (index) {
            return Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      overlayColor:
                          const WidgetStatePropertyAll(Colors.transparent),
                      onTap: () {
                        onPressedTap(index);
                      },
                      borderRadius: borderRadius2,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 900),
                        curve: Curves.fastLinearToSlowEaseIn,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: borderRadius2,
                          color: activeTab == index
                              ? Colors.white
                              : backgroundColor,
                        ),
                        child: Text(
                          tabBarItems[index],
                          style: const TextStyle(
                              color: Colors.black, fontSize: 15, height: 0.3),
                        ),
                      ),
                    ),
                  ),
                  if (index < 3)
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      child: VerticalDivider(
                        width: 1,
                        color: Colors.black12,
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
