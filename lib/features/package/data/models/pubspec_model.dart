import 'package:moein_moradi/features/package/data/models/dependencies_model.dart';
import 'package:moein_moradi/features/package/data/models/dev_dependencies_model.dart';
import 'package:moein_moradi/features/package/data/models/enviroment_model.dart';
import 'package:moein_moradi/features/package/data/models/excutables_model.dart';
import 'package:moein_moradi/features/package/data/models/platforms_model.dart';

class PubspecModel {
  final String? name;
  final String? description;
  final String? version;
  final String? repository;
  final EnvironmentModel? environment;
  final DependenciesModel? dependencies;
  final DevDependenciesModel? devDependencies;
  final ExecutablesModel? executables;
  final PlatformsModel? platforms;

  PubspecModel({
    this.name,
    this.description,
    this.version,
    this.repository,
    this.environment,
    this.dependencies,
    this.devDependencies,
    this.executables,
    this.platforms,
  });

  factory PubspecModel.fromJson(Map<String, dynamic> json) => PubspecModel(
        name: json["name"],
        description: json["description"],
        version: json["version"],
        repository: json["repository"],
        environment: json["environment"] == null
            ? null
            : EnvironmentModel.fromJson(json["environment"]),
        dependencies: json["dependencies"] == null
            ? null
            : DependenciesModel.fromJson(json["dependencies"]),
        devDependencies: json["dev_dependencies"] == null
            ? null
            : DevDependenciesModel.fromJson(json["dev_dependencies"]),
        executables: json["executables"] == null
            ? null
            : ExecutablesModel.fromJson(json["executables"]),
        platforms: json["platforms"] == null
            ? null
            : PlatformsModel.fromJson(json["platforms"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "version": version,
        "repository": repository,
        "environment": environment?.toJson(),
        "dependencies": dependencies?.toJson(),
        "dev_dependencies": devDependencies?.toJson(),
        "executables": executables?.toJson(),
        "platforms": platforms?.toJson(),
      };
}
