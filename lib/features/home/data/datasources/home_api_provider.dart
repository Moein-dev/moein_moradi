import 'package:moein_moradi/core/models/data_state.dart';
import 'package:moein_moradi/core/network/accounts_id.dart';
import 'package:moein_moradi/core/network/app_urls.dart';
import 'package:moein_moradi/core/network/http_request_handler.dart';

class HomeApiProvider {
  Future<DataState> getUserData() async {
    var response = await HttpRequestHandler.get(
      AppUrls.getUserLinkedinData,
      parameters: {
        "username": AccountsId.linkedIn,
      },
      customHeader: {
        "x-rapidapi-host":"linkedin-data-api.p.rapidapi.com",
        "x-rapidapi-key":"e25725d5d8msh74c6631ae33a9adp1c8b1bjsnacb31c261e74",
      }
    );

    if (response.$1 != null) {
      return DataSuccess(data: response.$1);
    } else {
      return DataFailed(error: response.$2!);
    }
  }
}
