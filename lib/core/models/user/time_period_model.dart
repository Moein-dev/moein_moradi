
import 'package:moein_moradi/core/models/user/date_model.dart';

class TimePeriod {
    final DateModel? start;
    final DateModel? end;

    TimePeriod({
        this.start,
        this.end,
    });

    factory TimePeriod.fromJson(Map<String, dynamic> json) => TimePeriod(
        start: json["start"] == null ? null : DateModel.fromJson(json["start"]),
        end: json["end"] == null ? null : DateModel.fromJson(json["end"]),
    );

    Map<String, dynamic> toJson() => {
        "start": start?.toJson(),
        "end": end?.toJson(),
    };
}