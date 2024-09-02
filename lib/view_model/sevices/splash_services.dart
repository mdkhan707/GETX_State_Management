import 'dart:async';
import 'package:get/get.dart';
import 'package:get_x/res/routes/routes_name.dart';
import 'package:get_x/view_model/controller/UserPreferences/user_preference.dart';

class SplashServices {
  UserPreference userPreference = UserPreference();

  void isLogin() {
    userPreference.GetUser().then((value) {
      print('Token: ${value.token}');
      print('IsLogin: ${value.isLogin}');

      if (value.isLogin == false || value.isLogin == null) {
        Timer(const Duration(seconds: 3),
            () => Get.toNamed(RoutesName.LoginScreen));
      } else {
        Timer(const Duration(seconds: 3),
            () => Get.toNamed(RoutesName.HomeScreen));
      }
    }).catchError((error) {
      // Handle any potential errors here
      print('Error retrieving user: $error');
      // Navigate to the login screen in case of an error
      Get.toNamed(RoutesName.LoginScreen);
    });
  }
}
