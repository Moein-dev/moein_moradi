
class ArticleImage {
    final String? url;
    final String? title;
    final String? link;

    ArticleImage({
        this.url,
        this.title,
        this.link,
    });

    factory ArticleImage.fromJson(Map<String, dynamic> json) => ArticleImage(
        url: json["url"],
        title: json["title"],
        link: json["link"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "title": title,
        "link": link,
    };
}