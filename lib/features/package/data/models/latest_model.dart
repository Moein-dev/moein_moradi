import 'package:moein_moradi/features/package/data/models/pubspec_model.dart';

class LatestModel {
  final String? version;
  final PubspecModel? pubspec;
  final String? archiveUrl;
  final String? archiveSha256;
  final DateTime? published;

  LatestModel({
    this.version,
    this.pubspec,
    this.archiveUrl,
    this.archiveSha256,
    this.published,
  });

  factory LatestModel.fromJson(Map<String, dynamic> json) => LatestModel(
        version: json["version"],
        pubspec: json["pubspec"] == null
            ? null
            : PubspecModel.fromJson(json["pubspec"]),
        archiveUrl: json["archive_url"],
        archiveSha256: json["archive_sha256"],
        published: json["published"] == null
            ? null
            : DateTime.parse(json["published"]),
      );

  Map<String, dynamic> toJson() => {
        "version": version,
        "pubspec": pubspec?.toJson(),
        "archive_url": archiveUrl,
        "archive_sha256": archiveSha256,
        "published": published?.toIso8601String(),
      };
}
