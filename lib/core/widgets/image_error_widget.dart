import 'package:flutter/material.dart';
import 'package:moein_moradi/config/assets/images.dart';

class ErrorImageWidget extends StatelessWidget {
  const ErrorImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      // color: themeData.colorScheme.coreBrandColors.snow,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            AppImages.appLogo,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "مشکلی در بارگذاری عکس بوجود آمده!",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelSmall!.apply(
                  color: themeData.colorScheme.outlineVariant,
                ),
          ),
        ],
      ),
    );
  }
}
