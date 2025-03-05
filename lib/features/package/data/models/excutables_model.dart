class ExecutablesModel {
  final String? customBuildTool;

  ExecutablesModel({
    this.customBuildTool,
  });

  factory ExecutablesModel.fromJson(Map<String, dynamic> json) =>
      ExecutablesModel(
        customBuildTool: json["custom_build_tool"],
      );

  Map<String, dynamic> toJson() => {
        "custom_build_tool": customBuildTool,
      };
}
