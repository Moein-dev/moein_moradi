import 'package:flutter/material.dart';
import 'package:moein_moradi/config/assets/images.dart';
import 'package:moein_moradi/core/models/image_model.dart';
import 'package:moein_moradi/core/widgets/image_error_widget.dart';

class ImageBuilder extends StatelessWidget {
  final double width;
  final ImageModel image;
  final BorderRadiusGeometry? borderRadius;
  final BoxFit fit;
  const ImageBuilder({
    super.key,
    required this.width,
    required this.image,
    this.borderRadius,
    this.fit = BoxFit.fitWidth,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(0),
      child:SizedBox(
        width: width,
        child: image.local != null
                ? Image.asset(
                    image.local!,
                    width: width,
                    height: width,
                    alignment: Alignment.center,
                    fit: BoxFit.fitWidth,
                    errorBuilder: (context, error, stackTrace) {
                      return const ErrorImageWidget();
                    },
                  )
                : image.file != null
                    ? Image.file(
                        image.file!,
                        width: width,
                        alignment: Alignment.center,
                        fit: BoxFit.fitWidth,
                        errorBuilder: (context, error, stackTrace) {
                          return const ErrorImageWidget();
                        },
                      )
                    : image.networkImage != null
                        ? FadeInImage.assetNetwork(
                            placeholder: AppImages.appLogo,
                            image: image.networkImage!,
                            width: width,
                            height: width,
                            fit: fit,
                            imageErrorBuilder: (context, error, stackTrace) {
                              return const ErrorImageWidget();
                            },
                          )
                        : const SizedBox(),
      ),
    );
  }
}
