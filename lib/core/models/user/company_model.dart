
import 'package:moein_moradi/core/models/user/head_quarter_model.dart';

class Company {
    final String? name;
    final String? universalName;
    final String? logo;
    final Headquarter? staffCountRange;
    final Headquarter? headquarter;

    Company({
        this.name,
        this.universalName,
        this.logo,
        this.staffCountRange,
        this.headquarter,
    });

    factory Company.fromJson(Map<String, dynamic> json) => Company(
        name: json["name"],
        universalName: json["universalName"],
        logo: json["logo"],
        staffCountRange: json["staffCountRange"] == null ? null : Headquarter.fromJson(json["staffCountRange"]),
        headquarter: json["headquarter"] == null ? null : Headquarter.fromJson(json["headquarter"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "universalName": universalName,
        "logo": logo,
        "staffCountRange": staffCountRange?.toJson(),
        "headquarter": headquarter?.toJson(),
    };
}