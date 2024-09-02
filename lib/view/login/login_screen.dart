import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/res/components/round_button.dart';
import 'package:get_x/utils/utils.dart';
import 'package:get_x/view_model/controller/login/login_view_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginVM = Get.put(LoginViewController());
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.deepPurple,
        title: Text('login'.tr),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: loginVM.emailcontroller.value,
                      focusNode: loginVM.emailfocusnodecontroller.value,
                      decoration: InputDecoration(
                        hintText: 'email_hint'.tr,
                        border: const OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          Utils.snackBar('Email', 'Enter Email');
                        }
                        return null;
                      },
                      onFieldSubmitted: (value) {
                        Utils.fieldFocusChange(
                            context,
                            loginVM.emailfocusnodecontroller.value,
                            loginVM.passwordfocusnodecontroller.value);
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      obscureText: true,
                      controller: loginVM.passwordcontroller.value,
                      focusNode: loginVM.passwordfocusnodecontroller.value,
                      decoration: InputDecoration(
                        hintText: 'password_hint'.tr,
                        border: const OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          Utils.snackBar('Password', 'Enter password');
                        }
                        return null;
                      },
                      onFieldSubmitted: (value) {},
                    ),
                  ],
                )),
            const SizedBox(height: 20),
            Obx(() => RoundButton(
                width: 200,
                title: 'login'.tr,
                loading: loginVM.loading.value,
                onPress: () {
                  if (_formkey.currentState!.validate()) {
                    loginVM.LoginApi();
                  }
                }))
          ],
        ),
      ),
    );
  }
}
