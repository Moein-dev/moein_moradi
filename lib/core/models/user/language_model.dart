
class Language {
    final String? name;
    final String? proficiency;

    Language({
        this.name,
        this.proficiency,
    });

    factory Language.fromJson(Map<String, dynamic> json) => Language(
        name: json["name"],
        proficiency: json["proficiency"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "proficiency": proficiency,
    };
}