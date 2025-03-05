import 'package:moein_moradi/core/models/user/contributor_model.dart';
import 'package:moein_moradi/core/models/user/date_model.dart';

class ProjectItem {
  final String? title;
  final String? description;
  final DateModel? start;
  final DateModel? end;
  final List<Contributor>? contributors;

  ProjectItem({
    this.title,
    this.description,
    this.start,
    this.end,
    this.contributors,
  });

  factory ProjectItem.fromJson(Map<String, dynamic> json) => ProjectItem(
        title: json["title"],
        description: json["description"],
        start: json["start"] == null ? null : DateModel.fromJson(json["start"]),
        end: json["end"] == null ? null : DateModel.fromJson(json["end"]),
        contributors: json["contributors"] == null
            ? []
            : List<Contributor>.from(
                json["contributors"]!.map((x) => Contributor.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "start": start?.toJson(),
        "end": end?.toJson(),
        "contributors": contributors == null
            ? []
            : List<dynamic>.from(contributors!.map((x) => x.toJson())),
      };
}
