class DependenciesModel {
  final String? args;
  final String? path;
  final String? yaml;

  DependenciesModel({
    this.args,
    this.path,
    this.yaml,
  });

  factory DependenciesModel.fromJson(Map<String, dynamic> json) =>
      DependenciesModel(
        args: json["args"],
        path: json["path"],
        yaml: json["yaml"],
      );

  Map<String, dynamic> toJson() => {
        "args": args,
        "path": path,
        "yaml": yaml,
      };
}
