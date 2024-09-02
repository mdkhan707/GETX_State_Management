import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/model/login/user_model.dart';
import 'package:get_x/repository/login_repository/login_repo.dart';
import 'package:get_x/res/routes/routes_name.dart';
import 'package:get_x/utils/utils.dart';
import 'package:get_x/view_model/controller/UserPreferences/user_preference.dart';

class LoginViewController extends GetxController {
  UserPreference userPreference = UserPreference();
  final _api = LoginRepo();
  final emailcontroller = TextEditingController().obs;
  final passwordcontroller = TextEditingController().obs;

  final emailfocusnodecontroller = FocusNode().obs;
  final passwordfocusnodecontroller = FocusNode().obs;

  RxBool loading = false.obs;

  void LoginApi() {
    loading.value = true;
    Map data = {
      'email': emailcontroller.value.text,
      'password': passwordcontroller.value.text,
    };
    _api.loginApi(data).then((value) {
      loading.value = false;
      if (value['error'] == 'user not found') {
        Utils.snackBar('Login', value['error']);
      } else {
        UserModel userModel = UserModel(token: value['token'], isLogin: true);
        userPreference.SaveUser(userModel).then((value) {
          Get.toNamed(RoutesName.HomeScreen);
        }).onError(
          (error, stackTrace) {},
        );
        Utils.snackBar('Login', 'login successfully');
      }
    }).onError((error, StackTrace) {
      loading.value = false;
      Utils.snackBar('Error', error.toString());
    });
  }
}
