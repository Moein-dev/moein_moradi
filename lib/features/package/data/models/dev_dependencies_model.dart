class DevDependenciesModel {
  final String? build;
  final String? buildRunner;
  final String? lints;
  final String? test;

  DevDependenciesModel({
    this.build,
    this.buildRunner,
    this.lints,
    this.test,
  });

  factory DevDependenciesModel.fromJson(Map<String, dynamic> json) =>
      DevDependenciesModel(
        build: json["build"],
        buildRunner: json["build_runner"],
        lints: json["lints"],
        test: json["test"],
      );

  Map<String, dynamic> toJson() => {
        "build": build,
        "build_runner": buildRunner,
        "lints": lints,
        "test": test,
      };
}
