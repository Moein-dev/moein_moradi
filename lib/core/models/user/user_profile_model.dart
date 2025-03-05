import 'package:moein_moradi/core/models/user/background_image_model.dart';
import 'package:moein_moradi/core/models/user/certification_model.dart';
import 'package:moein_moradi/core/models/user/education_model.dart';
import 'package:moein_moradi/core/models/user/geo_model.dart';
import 'package:moein_moradi/core/models/user/language_model.dart';
import 'package:moein_moradi/core/models/user/multi_local_first_name_model.dart';
import 'package:moein_moradi/core/models/user/position_model.dart';
import 'package:moein_moradi/core/models/user/project_model.dart';
import 'package:moein_moradi/core/models/user/skill_model.dart';
import 'package:moein_moradi/core/models/user/supported_locale_model.dart';

class UserProfileModel {
  final int? id;
  final String? urn;
  final String? username;
  final String? firstName;
  final String? lastName;
  final bool? isCreator;
  final bool? isOpenToWork;
  final bool? isHiring;
  final String? profilePicture;
  final List<BackgroundImage>? backgroundImage;
  final String? summary;
  final String? headline;
  final Geo? geo;
  final List<Language>? languages;
  final List<Education>? educations;
  final List<Position>? position;
  final List<Position>? fullPositions;
  final List<Skill>? skills;
  final dynamic givenRecommendation;
  final int? givenRecommendationCount;
  final dynamic receivedRecommendation;
  final int? receivedRecommendationCount;
  final dynamic courses;
  final List<Certification>? certifications;
  final dynamic honors;
  final Projects? projects;
  final dynamic volunteering;
  final List<SupportedLocale>? supportedLocales;
  final MultiLocaleNameClass? multiLocaleFirstName;
  final MultiLocaleNameClass? multiLocaleLastName;
  final MultiLocaleNameClass? multiLocaleHeadline;

  UserProfileModel({
    this.id,
    this.urn,
    this.username,
    this.firstName,
    this.lastName,
    this.isCreator,
    this.isOpenToWork,
    this.isHiring,
    this.profilePicture,
    this.backgroundImage,
    this.summary,
    this.headline,
    this.geo,
    this.languages,
    this.educations,
    this.position,
    this.fullPositions,
    this.skills,
    this.givenRecommendation,
    this.givenRecommendationCount,
    this.receivedRecommendation,
    this.receivedRecommendationCount,
    this.courses,
    this.certifications,
    this.honors,
    this.projects,
    this.volunteering,
    this.supportedLocales,
    this.multiLocaleFirstName,
    this.multiLocaleLastName,
    this.multiLocaleHeadline,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      UserProfileModel(
        id: json["id"],
        urn: json["urn"],
        username: json["username"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        isCreator: json["isCreator"],
        isOpenToWork: json["isOpenToWork"],
        isHiring: json["isHiring"],
        profilePicture: json["profilePicture"],
        backgroundImage: json["backgroundImage"] == null
            ? []
            : List<BackgroundImage>.from(json["backgroundImage"]!
                .map((x) => BackgroundImage.fromJson(x))),
        summary: json["summary"],
        headline: json["headline"],
        geo: json["geo"] == null ? null : Geo.fromJson(json["geo"]),
        languages: json["languages"] == null
            ? []
            : List<Language>.from(
                json["languages"]!.map((x) => Language.fromJson(x))),
        educations: json["educations"] == null
            ? []
            : List<Education>.from(
                json["educations"]!.map((x) => Education.fromJson(x))),
        position: json["position"] == null
            ? []
            : List<Position>.from(
                json["position"]!.map((x) => Position.fromJson(x))),
        fullPositions: json["fullPositions"] == null
            ? []
            : List<Position>.from(
                json["fullPositions"]!.map((x) => Position.fromJson(x))),
        skills: json["skills"] == null
            ? []
            : List<Skill>.from(json["skills"]!.map((x) => Skill.fromJson(x))),
        givenRecommendation: json["givenRecommendation"],
        givenRecommendationCount: json["givenRecommendationCount"],
        receivedRecommendation: json["receivedRecommendation"],
        receivedRecommendationCount: json["receivedRecommendationCount"],
        courses: json["courses"],
        certifications: json["certifications"] == null
            ? []
            : List<Certification>.from(
                json["certifications"]!.map((x) => Certification.fromJson(x))),
        honors: json["honors"],
        projects: json["projects"] == null
            ? null
            : Projects.fromJson(json["projects"]),
        volunteering: json["volunteering"],
        supportedLocales: json["supportedLocales"] == null
            ? []
            : List<SupportedLocale>.from(json["supportedLocales"]!
                .map((x) => SupportedLocale.fromJson(x))),
        multiLocaleFirstName: json["multiLocaleFirstName"] == null
            ? null
            : MultiLocaleNameClass.fromJson(json["multiLocaleFirstName"]),
        multiLocaleLastName: json["multiLocaleLastName"] == null
            ? null
            : MultiLocaleNameClass.fromJson(json["multiLocaleLastName"]),
        multiLocaleHeadline: json["multiLocaleHeadline"] == null
            ? null
            : MultiLocaleNameClass.fromJson(json["multiLocaleHeadline"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "urn": urn,
        "username": username,
        "firstName": firstName,
        "lastName": lastName,
        "isCreator": isCreator,
        "isOpenToWork": isOpenToWork,
        "isHiring": isHiring,
        "profilePicture": profilePicture,
        "backgroundImage": backgroundImage == null
            ? []
            : List<dynamic>.from(backgroundImage!.map((x) => x.toJson())),
        "summary": summary,
        "headline": headline,
        "geo": geo?.toJson(),
        "languages": languages == null
            ? []
            : List<dynamic>.from(languages!.map((x) => x.toJson())),
        "educations": educations == null
            ? []
            : List<dynamic>.from(educations!.map((x) => x.toJson())),
        "position": position == null
            ? []
            : List<dynamic>.from(position!.map((x) => x.toJson())),
        "fullPositions": fullPositions == null
            ? []
            : List<dynamic>.from(fullPositions!.map((x) => x.toJson())),
        "skills": skills == null
            ? []
            : List<dynamic>.from(skills!.map((x) => x.toJson())),
        "givenRecommendation": givenRecommendation,
        "givenRecommendationCount": givenRecommendationCount,
        "receivedRecommendation": receivedRecommendation,
        "receivedRecommendationCount": receivedRecommendationCount,
        "courses": courses,
        "certifications": certifications == null
            ? []
            : List<dynamic>.from(certifications!.map((x) => x.toJson())),
        "honors": honors,
        "projects": projects?.toJson(),
        "volunteering": volunteering,
        "supportedLocales": supportedLocales == null
            ? []
            : List<dynamic>.from(supportedLocales!.map((x) => x.toJson())),
        "multiLocaleFirstName": multiLocaleFirstName?.toJson(),
        "multiLocaleLastName": multiLocaleLastName?.toJson(),
        "multiLocaleHeadline": multiLocaleHeadline?.toJson(),
      };
}
