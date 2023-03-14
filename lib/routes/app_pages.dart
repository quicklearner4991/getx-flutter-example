import 'package:get/get.dart';
import 'package:getx_flutter_example/bindings/home_bindings.dart';
import 'package:getx_flutter_example/view/addProduct/addProduct.dart';
import 'package:getx_flutter_example/view/home/home_screen.dart';

import '../bindings/login_binding.dart';
import '../bindings/splash_binding.dart';
import '../view/login/login_screen.dart';
import '../view/splash/splash_screen.dart';
part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: Routes.INITIAL, page: () => const SplashScreen(), binding: SplashBinding()),
    GetPage(
        name: Routes.LOGIN, page: () => const LoginScreen(), binding: LoginBinding()),
    GetPage(
        name: Routes.DASHBOARD, page: () => const HomeScreen(), binding: HomeBinding()),
    GetPage(
        name: Routes.addProduct, page: () =>  AddProduct()),
  ];
}
