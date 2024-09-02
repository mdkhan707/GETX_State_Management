import 'package:get_x/data/network/network_api_services.dart';
import 'package:get_x/res/URL/app_url.dart';

class LoginRepo {
  final _apiservices = NetworkApiServices();

  Future<dynamic> loginApi(var data) async {
    dynamic response = await _apiservices.postApi(data, AppUrl.loginUrl);
    return response;
  }
}
