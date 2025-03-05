part of 'extensions.dart';

extension SuffixAssets on String {
  get makeSvgSuffix {
    return "$this.svg";
  }

  get makePngSuffix {
    return "$this.png";
  }

  get makeJpgSuffix {
    return "$this.jpg";
  }

  String get removeHtmlTags {
    final RegExp exp = RegExp(r'<[^>]*>', multiLine: true, caseSensitive: true);
    return replaceAll(exp, '');
  }

  String get findImageUrl {
    final imgTagRegex =
        RegExp(r'<img[^>]+src="([^">]+)"', caseSensitive: false);
    final match = imgTagRegex.firstMatch(this);
    return match?.group(1) ?? "";
  }
}
