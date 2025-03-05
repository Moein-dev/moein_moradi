import 'package:moein_moradi/core/models/user/company_model.dart';
import 'package:moein_moradi/core/models/user/date_model.dart';
import 'package:moein_moradi/core/models/user/time_period_model.dart';

class Certification {
  final String? name;
  final DateModel? start;
  final DateModel? end;
  final String? authority;
  final Company? company;
  final TimePeriod? timePeriod;

  Certification({
    this.name,
    this.start,
    this.end,
    this.authority,
    this.company,
    this.timePeriod,
  });

  factory Certification.fromJson(Map<String, dynamic> json) => Certification(
        name: json["name"],
        start: json["start"] == null ? null : DateModel.fromJson(json["start"]),
        end: json["end"] == null ? null : DateModel.fromJson(json["end"]),
        authority: json["authority"],
        company:
            json["company"] == null ? null : Company.fromJson(json["company"]),
        timePeriod: json["timePeriod"] == null
            ? null
            : TimePeriod.fromJson(json["timePeriod"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "start": start?.toJson(),
        "end": end?.toJson(),
        "authority": authority,
        "company": company?.toJson(),
        "timePeriod": timePeriod?.toJson(),
      };
}
