
import 'package:moein_moradi/core/models/user/background_image_model.dart';

class Contributor {
    final String? urn;
    final String? username;
    final String? fullName;
    final String? firstName;
    final String? lastName;
    final List<BackgroundImage>? profilePicture;
    final String? headline;
    final String? url;

    Contributor({
        this.urn,
        this.username,
        this.fullName,
        this.firstName,
        this.lastName,
        this.profilePicture,
        this.headline,
        this.url,
    });

    factory Contributor.fromJson(Map<String, dynamic> json) => Contributor(
        urn: json["urn"],
        username: json["username"],
        fullName: json["fullName"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        profilePicture: json["profilePicture"] == null ? [] : List<BackgroundImage>.from(json["profilePicture"]!.map((x) => BackgroundImage.fromJson(x))),
        headline: json["headline"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "urn": urn,
        "username": username,
        "fullName": fullName,
        "firstName": firstName,
        "lastName": lastName,
        "profilePicture": profilePicture == null ? [] : List<dynamic>.from(profilePicture!.map((x) => x.toJson())),
        "headline": headline,
        "url": url,
    };
}