
class Geo {
    final String? country;
    final String? city;
    final String? full;

    Geo({
        this.country,
        this.city,
        this.full,
    });

    factory Geo.fromJson(Map<String, dynamic> json) => Geo(
        country: json["country"],
        city: json["city"],
        full: json["full"],
    );

    Map<String, dynamic> toJson() => {
        "country": country,
        "city": city,
        "full": full,
    };
}