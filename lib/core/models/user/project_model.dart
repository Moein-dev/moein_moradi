import 'package:moein_moradi/core/models/user/project_item_model.dart';

class Projects {
  final int? total;
  final List<ProjectItem>? items;

  Projects({
    this.total,
    this.items,
  });

  factory Projects.fromJson(Map<String, dynamic> json) => Projects(
        total: json["total"],
        items: json["items"] == null
            ? []
            : List<ProjectItem>.from(
                json["items"]!.map((x) => ProjectItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}
