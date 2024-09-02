import 'package:get/get.dart';
import 'package:get_x/res/routes/routes_name.dart';
import 'package:get_x/view/home/home_screen.dart';
import 'package:get_x/view/login/login_screen.dart';
import 'package:get_x/view/splash_screen.dart';

class Routes {
  static approutes() => [
        GetPage(
          name: RoutesName.SplashScreen,
          page: () => const SpalshScreen(),
          transitionDuration: const Duration(milliseconds: 250),
        ),
        GetPage(
          name: RoutesName.LoginScreen,
          page: () => const LoginScreen(),
          transitionDuration: const Duration(milliseconds: 250),
        ),
        GetPage(
          name: RoutesName.HomeScreen,
          page: () => const HomeView(),
          transitionDuration: const Duration(milliseconds: 250),
        )
      ];
}
