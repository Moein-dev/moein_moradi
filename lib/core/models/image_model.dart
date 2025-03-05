import 'dart:io';
import 'package:flutter/services.dart';

class ImageModel {
  final String? local;
  final String? networkVector;
  final String? networkImage;
  final File? file;
  final Uint8List? image;

  ImageModel({
    this.local,
    this.networkVector,
    this.networkImage,
    this.file,
    this.image,
  }) : assert(local != null ||
            networkVector != null ||
            file != null ||
            image != null ||
            networkImage != null);
}
