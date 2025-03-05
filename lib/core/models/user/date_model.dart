class DateModel {
  final int? year;
  final int? month;
  final int? day;

  DateModel({
    this.year,
    this.month,
    this.day,
  });

  factory DateModel.fromJson(Map<String, dynamic> json) => DateModel(
        year: json["year"],
        month: json["month"],
        day: json["day"],
      );

  Map<String, dynamic> toJson() => {
        "year": year,
        "month": month,
        "day": day,
      };
}
