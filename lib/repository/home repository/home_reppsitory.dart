import 'package:get_x/data/network/network_api_services.dart';
import 'package:get_x/model/home/user_list_model.dart';
import 'package:get_x/res/URL/app_url.dart';

class HomeReppsitory {
  final _apiservices = NetworkApiServices();

  Future<dynamic> HomeApi() async {
    dynamic response = await _apiservices.getApi(AppUrl.UserListApi);
    return UserListModel.fromJson(response);
  }
}
