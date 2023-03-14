import 'dart:async';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../routes/app_pages.dart';
import '../../utils/AppConstants.dart';

class SplashController extends GetxController {
  moveToNextScreen() async {
    GetStorage storage = GetStorage();
    var isLoggedIn = await storage.read(AppConstants.IS_LOGGED_IN);
    if (isLoggedIn != null && isLoggedIn) {
      print(isLoggedIn);
      Timer(const Duration(seconds: 3), () => Get.offAndToNamed(Routes.DASHBOARD));
    } else {
      Timer(const Duration(seconds: 3), () => Get.offAndToNamed(Routes.LOGIN));
    }
  }
}
