import 'package:moein_moradi/core/network/accounts_id.dart';

class AppUrls {
  static String linkedIn = "https://www.linkedin.com/in/${AccountsId.linkedIn}";
  static String medium = "https://medium.com/${AccountsId.medium}";
  static String gitHub = "https://github.com/${AccountsId.gitHub}";
  static String pubDev = "https://pub.dev/publishers/${AccountsId.pubDev}/packages";
  static String mail = "moeinmoradi@gmail.com";
  static String getPackages =
      "https://pub.dev/api/search?q=publisher%3Amoeinmoradi.ir";
  static String getPackageDetails(String packageName) =>
      "https://pub.dev/api/packages/$packageName";
  static String getMediumArticles = "https://medium.com/feed/@moeinmoradi.dev";

  static String getUserLinkedinData =
      "https://linkedin-data-api.p.rapidapi.com/";
}
