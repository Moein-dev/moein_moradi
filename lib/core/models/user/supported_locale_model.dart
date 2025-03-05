
class SupportedLocale {
    final String? country;
    final String? language;

    SupportedLocale({
        this.country,
        this.language,
    });

    factory SupportedLocale.fromJson(Map<String, dynamic> json) => SupportedLocale(
        country: json["country"],
        language: json["language"],
    );

    Map<String, dynamic> toJson() => {
        "country": country,
        "language": language,
    };
}