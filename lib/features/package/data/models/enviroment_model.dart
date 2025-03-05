class EnvironmentModel {
  final String? sdk;

  EnvironmentModel({
    this.sdk,
  });

  factory EnvironmentModel.fromJson(Map<String, dynamic> json) =>
      EnvironmentModel(
        sdk: json["sdk"],
      );

  Map<String, dynamic> toJson() => {
        "sdk": sdk,
      };
}
