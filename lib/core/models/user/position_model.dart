import 'package:moein_moradi/config/enums/enums.dart';
import 'package:moein_moradi/core/models/user/date_model.dart';
import 'package:moein_moradi/core/models/enum_values.dart';
import 'package:moein_moradi/core/models/user/multi_local_company_name_model.dart';

class Position {
  final int? companyId;
  final String? companyName;
  final String? companyUsername;
  final String? companyUrl;
  final String? companyLogo;
  final String? companyIndustry;
  final String? companyStaffCountRange;
  final String? title;
  final MultiLocaleCompanyNameClass? multiLocaleTitle;
  final MultiLocaleCompanyNameClass? multiLocaleCompanyName;
  final String? location;
  final String? description;
  final EmploymentType? employmentType;
  final DateModel? start;
  final DateModel? end;

  Position({
    this.companyId,
    this.companyName,
    this.companyUsername,
    this.companyUrl,
    this.companyLogo,
    this.companyIndustry,
    this.companyStaffCountRange,
    this.title,
    this.multiLocaleTitle,
    this.multiLocaleCompanyName,
    this.location,
    this.description,
    this.employmentType,
    this.start,
    this.end,
  });

  factory Position.fromJson(Map<String, dynamic> json) => Position(
        companyId: json["companyId"],
        companyName: json["companyName"],
        companyUsername: json["companyUsername"],
        companyUrl: json["companyURL"],
        companyLogo: json["companyLogo"],
        companyIndustry: json["companyIndustry"],
        companyStaffCountRange: json["companyStaffCountRange"],
        title: json["title"],
        multiLocaleTitle: json["multiLocaleTitle"] == null
            ? null
            : MultiLocaleCompanyNameClass.fromJson(json["multiLocaleTitle"]),
        multiLocaleCompanyName: json["multiLocaleCompanyName"] == null
            ? null
            : MultiLocaleCompanyNameClass.fromJson(
                json["multiLocaleCompanyName"]),
        location: json["location"],
        description: json["description"],
        employmentType: employmentTypeValues.map[json["employmentType"]]!,
        start: json["start"] == null ? null : DateModel.fromJson(json["start"]),
        end: json["end"] == null ? null : DateModel.fromJson(json["end"]),
      );

  Map<String, dynamic> toJson() => {
        "companyId": companyId,
        "companyName": companyName,
        "companyUsername": companyUsername,
        "companyURL": companyUrl,
        "companyLogo": companyLogo,
        "companyIndustry": companyIndustry,
        "companyStaffCountRange": companyStaffCountRange,
        "title": title,
        "multiLocaleTitle": multiLocaleTitle?.toJson(),
        "multiLocaleCompanyName": multiLocaleCompanyName?.toJson(),
        "location": location,
        "description": description,
        "employmentType": employmentTypeValues.reverse[employmentType],
        "start": start?.toJson(),
        "end": end?.toJson(),
      };
}

final employmentTypeValues = EnumValues({"Full-time": EmploymentType.fullTime});
