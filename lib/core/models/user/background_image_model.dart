
class BackgroundImage {
    final int? width;
    final int? height;
    final String? url;

    BackgroundImage({
        this.width,
        this.height,
        this.url,
    });

    factory BackgroundImage.fromJson(Map<String, dynamic> json) => BackgroundImage(
        width: json["width"],
        height: json["height"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "width": width,
        "height": height,
        "url": url,
    };
}