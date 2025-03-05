import 'package:moein_moradi/core/models/user/date_model.dart';

class Education {
  final DateModel? start;
  final DateModel? end;
  final String? fieldOfStudy;
  final String? degree;
  final String? grade;
  final String? schoolName;
  final String? description;
  final String? activities;
  final String? url;
  final String? schoolId;

  Education({
    this.start,
    this.end,
    this.fieldOfStudy,
    this.degree,
    this.grade,
    this.schoolName,
    this.description,
    this.activities,
    this.url,
    this.schoolId,
  });

  factory Education.fromJson(Map<String, dynamic> json) => Education(
        start: json["start"] == null ? null : DateModel.fromJson(json["start"]),
        end: json["end"] == null ? null : DateModel.fromJson(json["end"]),
        fieldOfStudy: json["fieldOfStudy"],
        degree: json["degree"],
        grade: json["grade"],
        schoolName: json["schoolName"],
        description: json["description"],
        activities: json["activities"],
        url: json["url"],
        schoolId: json["schoolId"],
      );

  Map<String, dynamic> toJson() => {
        "start": start?.toJson(),
        "end": end?.toJson(),
        "fieldOfStudy": fieldOfStudy,
        "degree": degree,
        "grade": grade,
        "schoolName": schoolName,
        "description": description,
        "activities": activities,
        "url": url,
        "schoolId": schoolId,
      };
}
