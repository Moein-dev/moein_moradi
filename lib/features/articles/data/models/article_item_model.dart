
class ArticleItem {
    final String? title;
    final String? link;
    final String? guid;
    final List<String>? category;
    final String? dcCreator;
    final String? pubDate;
    final DateTime? atomUpdated;
    final String? contentEncoded;

    ArticleItem({
        this.title,
        this.link,
        this.guid,
        this.category,
        this.dcCreator,
        this.pubDate,
        this.atomUpdated,
        this.contentEncoded,
    });

    factory ArticleItem.fromJson(Map<String, dynamic> json) => ArticleItem(
        title: json["title"],
        link: json["link"],
        guid: json["guid"],
        category: json["category"] == null ? [] : List<String>.from(json["category"]!.map((x) => x)),
        dcCreator: json["dc:creator"],
        pubDate: json["pubDate"],
        atomUpdated: json["atom:updated"] == null ? null : DateTime.parse(json["atom:updated"]),
        contentEncoded: json["content:encoded"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "link": link,
        "guid": guid,
        "category": category == null ? [] : List<dynamic>.from(category!.map((x) => x)),
        "dc:creator": dcCreator,
        "pubDate": pubDate,
        "atom:updated": atomUpdated?.toIso8601String(),
        "content:encoded": contentEncoded,
    };
}