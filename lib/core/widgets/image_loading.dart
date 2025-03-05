import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ImageLoading extends StatelessWidget {
  final double width;
  const ImageLoading({
    super.key,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      width: width,
      alignment: Alignment.center,
      child: Shimmer.fromColors(
        baseColor: themeData.colorScheme.outline,
        highlightColor: themeData.colorScheme.outlineVariant,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: themeData.colorScheme.outline,
          ),
        ),
      ),
    );
  }
}
