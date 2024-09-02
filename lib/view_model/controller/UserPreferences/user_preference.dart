import 'package:get_x/model/login/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreference {
  Future<bool> SaveUser(UserModel usermodel) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', usermodel.token.toString());
    sp.setBool('isLogin', usermodel.isLogin!);
    return true;
  }

  Future<UserModel> GetUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString('token');
    bool? isLogin = sp.getBool('isLogin');

    // Check if the values are correctly retrieved
    if (token == null || isLogin == null) {
      // Handle the case where one of the values is null, possibly returning a default user or throwing an error
      print('Error: Retrieved null values from SharedPreferences');
      return UserModel(token: '', isLogin: false);
    }

    return UserModel(token: token, isLogin: isLogin);
  }

  Future<bool> ClearUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    return true;
  }
}
