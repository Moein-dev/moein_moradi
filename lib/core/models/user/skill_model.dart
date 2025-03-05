
class Skill {
    final String? name;
    final bool? passedSkillAssessment;
    final int? endorsementsCount;

    Skill({
        this.name,
        this.passedSkillAssessment,
        this.endorsementsCount,
    });

    factory Skill.fromJson(Map<String, dynamic> json) => Skill(
        name: json["name"],
        passedSkillAssessment: json["passedSkillAssessment"],
        endorsementsCount: json["endorsementsCount"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "passedSkillAssessment": passedSkillAssessment,
        "endorsementsCount": endorsementsCount,
    };
}