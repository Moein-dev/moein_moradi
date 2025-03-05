class MultiLocaleNameClass {
  final String? en;

  MultiLocaleNameClass({
    this.en,
  });

  factory MultiLocaleNameClass.fromJson(Map<String, dynamic> json) =>
      MultiLocaleNameClass(
        en: json["en"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
      };
}
