import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:moein_moradi/config/assets/fonts.dart';
import 'package:moein_moradi/config/assets/images.dart';
import 'package:moein_moradi/core/models/image_model.dart';
import 'package:moein_moradi/core/network/app_urls.dart';
import 'package:moein_moradi/core/services/url_launcher.dart';
import 'package:moein_moradi/core/widgets/image_builder.dart';
import 'package:moein_moradi/features/home/presentation/widgets/app_bottom_tab_bar.dart';
import 'package:moein_moradi/features/home/presentation/widgets/app_button.dart';
import 'package:moein_moradi/features/home/presentation/widgets/app_tab_bar.dart';

class HomePage extends StatelessWidget {
  final StatefulNavigationShell child;
  const HomePage({
    super.key,
    required this.child,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFAFAFA),
      body: Row(
        children: [
          Container(
            color: const Color(0xfff5f5f5),
            padding: const EdgeInsets.all(32),
            width: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ImageBuilder(
                  width: 100,
                  image: ImageModel(
                    local: AppImages.profile,
                  ),
                ),
                const Spacer(),
                Text(
                  "Senior Flutter Developer",
                  style: TextStyle(
                    fontSize: 64,
                    fontFamily: AppFonts.sfPro,
                    fontWeight: FontWeight.bold,
                    height: 0.84,
                  ),
                ),
                const Spacer(),
                Text(
                  """
🚀 Flutter Dev crafting seamless apps! From Ionic to Java, now conquering diverse challenges. TDD & MVC maestro. Ready for new mobile adventures! 🚀
""",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
                const Spacer(),
                AppButton(
                  onPressed: () {
                    AppUrlLauncher.webUrl(url: AppUrls.linkedIn);
                  },
                  title: "LinkedIn",
                ),
                AppButton(
                  onPressed: () {
                    AppUrlLauncher.webUrl(url: AppUrls.medium);
                  },
                  title: "Medium",
                ),
                AppButton(
                  onPressed: () {
                    AppUrlLauncher.webUrl(url: AppUrls.gitHub);
                  },
                  title: "GitHub",
                ),
                AppButton(
                  onPressed: () {
                    AppUrlLauncher.webUrl(url: AppUrls.pubDev);
                  },
                  title: "PubDev",
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    AppUrlLauncher.mailUrl(email: AppUrls.mail);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26),
                    ),
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                  ),
                  child: const SizedBox(
                    width: double.maxFinite,
                    child: Center(
                      child: Text(
                        "Get in touch",
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  AppTabBar(
                    onPressedTap: (index) {
                      child.goBranch(
                        index,
                        initialLocation: index == child.currentIndex,
                      );
                    },
                    activeTab: child.currentIndex,
                  ),
                  const Gap(30),
                  AppBottomTabBar(
                    child: child,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
