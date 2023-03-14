import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../routes/app_pages.dart';

class LoginController extends GetxController {
  var emailValidate = true.obs;
  var passwordValidate = true.obs;
  bool isLoading = false;

  moveToNextScreen() async {
    Get.offAndToNamed(Routes.DASHBOARD);
  }

  bool validateEmailTextField(String userInput) {
    if (userInput.isEmpty) {
      emailValidate(false);
      return false;
    }
    emailValidate(true);
    update();
    return true;
  }

  bool validatePasswordTextField(String userInput) {
    if (userInput.isEmpty) {
      passwordValidate(false);
      return false;
    }
    passwordValidate(true);
    update();
    return true;
  }
}
