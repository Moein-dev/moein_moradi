import 'package:moein_moradi/features/package/data/models/latest_model.dart';

class PackageModel {
  final String? name;
  final LatestModel? latest;
  final List<LatestModel>? versions;

  PackageModel({
    this.name,
    this.latest,
    this.versions,
  });

  factory PackageModel.fromJson(Map<String, dynamic> json) => PackageModel(
        name: json["name"],
        latest: json["latest"] == null
            ? null
            : LatestModel.fromJson(json["latest"]),
        versions: json["versions"] == null
            ? []
            : List<LatestModel>.from(
                json["versions"]!.map((x) => LatestModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "latest": latest?.toJson(),
        "versions": versions == null
            ? []
            : List<dynamic>.from(versions!.map((x) => x.toJson())),
      };
}
