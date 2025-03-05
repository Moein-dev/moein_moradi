class PlatformsModel {
  final dynamic android;
  final dynamic ios;
  final int? platfomrsCount;
  final List<String>? platforms;

  PlatformsModel({
    this.android,
    this.ios,
    this.platfomrsCount,
    this.platforms,
  });

  factory PlatformsModel.fromJson(Map<String, dynamic> json) => PlatformsModel(
        android: json["android"],
        ios: json["ios"],
        platfomrsCount: json.keys.length,
        platforms: json.keys.toList(),
      );

  Map<String, dynamic> toJson() => {
        "android": android,
        "ios": ios,
        "platforms_count": platfomrsCount,
      };
}
