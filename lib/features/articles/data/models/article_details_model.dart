import 'package:moein_moradi/features/articles/data/models/article_image_model.dart';
import 'package:moein_moradi/features/articles/data/models/article_item_model.dart';

class ArticleDetails {
  final String? title;
  final String? description;
  final String? link;
  final ArticleImage? image;
  final String? generator;
  final String? lastBuildDate;
  final dynamic atomLink;
  final String? webMaster;
  final List<ArticleItem>? item;

  ArticleDetails({
    this.title,
    this.description,
    this.link,
    this.image,
    this.generator,
    this.lastBuildDate,
    this.atomLink,
    this.webMaster,
    this.item,
  });

  factory ArticleDetails.fromJson(Map<String, dynamic> json) => ArticleDetails(
        title: json["title"],
        description: json["description"],
        link: json["link"],
        image:
            json["image"] == null ? null : ArticleImage.fromJson(json["image"]),
        generator: json["generator"],
        lastBuildDate: json["lastBuildDate"],
        atomLink: json["atom:link"],
        webMaster: json["webMaster"],
        item: json["item"] == null
            ? []
            : List<ArticleItem>.from(
                json["item"]!.map((x) => ArticleItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "link": link,
        "image": image?.toJson(),
        "generator": generator,
        "lastBuildDate": lastBuildDate,
        "atom:link": atomLink,
        "webMaster": webMaster,
        "item": item == null
            ? []
            : List<dynamic>.from(item!.map((x) => x.toJson())),
      };
}
