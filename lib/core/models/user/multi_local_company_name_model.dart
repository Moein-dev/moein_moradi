
class MultiLocaleCompanyNameClass {
    final String? enUs;

    MultiLocaleCompanyNameClass({
        this.enUs,
    });

    factory MultiLocaleCompanyNameClass.fromJson(Map<String, dynamic> json) => MultiLocaleCompanyNameClass(
        enUs: json["en_US"],
    );

    Map<String, dynamic> toJson() => {
        "en_US": enUs,
    };
}