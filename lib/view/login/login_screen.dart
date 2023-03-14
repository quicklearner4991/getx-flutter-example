import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import '../../controller/login/login_controller.dart';
import '../../theme/app_colors.dart';
import '../../utils/AppConstants.dart';
import '../../utils/WodlDimens.dart';
import '../../utils/common_widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final LoginController _controller = Get.put(LoginController());
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: ListView(
              padding:  const EdgeInsets.all(SPACE20),
              children: [
                Container(
                  height: SPACE40,
                  width: SPACE40,
                  margin:
                      const EdgeInsets.fromLTRB(0, SPACE32, 0, 0),
                  child: const Icon(Icons.ac_unit),
                ),
                Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(SPACE8),
                      color: TEXTFIELD_BACK_COLOR,
                    ),
                    width: double.infinity,
                    margin:
                        const EdgeInsets.fromLTRB(0, SPACE52, 0, 0),
                    child: GetX<LoginController>(builder: (controller) {
                      return CsCommonTextFieldWidget(
                        isPassword: false,
                        hintText: AppConstants.EMAIL,
                        textController: _emailController,
                        errorText: AppConstants.VALID_EMAIL,
                        errorValidate: _controller.emailValidate.value,
                      );
                    })),
                Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(SPACE8),
                      color: TEXTFIELD_BACK_COLOR,
                    ),
                    width: double.infinity,
                    margin:
                        const EdgeInsets.fromLTRB(0, SPACE20, 0, 0),
                    child: GetX<LoginController>(
                      builder: (controller) {
                        return CsCommonTextFieldWidget(
                          isPassword: true,
                          hintText: AppConstants.PASSOWRD,
                          textController: _passwordController,
                          errorText: AppConstants.VALID_PASSWORD,
                          errorValidate: _controller.passwordValidate.value,
                        );
                      },
                    )),
                Container(
                  width: double.infinity,
                  margin:
                      const EdgeInsets.fromLTRB(0, SPACE40, 0, 0),
                  child: CsCommonButtonWidget(
                    onPressed: () async {
                      if (!_controller.validateEmailTextField(
                          _emailController.value.text)) {
                        return;
                      }
                      if (!_controller.validatePasswordTextField(
                          _passwordController.value.text)) {
                        return;
                      }
                      GetStorage storage = GetStorage();
                      storage.write(AppConstants.IS_LOGGED_IN, true);
                      _controller.moveToNextScreen();
                    },
                    titleText: AppConstants.LOGIN,
                  ),
                ),
                const SizedBox(
                  height: SPACE82,
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.centerRight,
                  margin:
                      const EdgeInsets.fromLTRB(0, SPACE16, 0, 0),
                  child: InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            AppConstants.DONT_HAVE_ACCOUNT,
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(
                                    color: PLACE_HOLDER_COLOR,
                                    fontSize: SPACE16),
                          ),
                          const SizedBox(
                            width: SPACE6,
                          ),
                          InkWell(
                            child: Text(
                              AppConstants.REGISTER,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(
                                      color: APP_PRIMARY_DARK_COLOR,
                                      fontSize: SPACE16),
                            ),
                            onTap: () {
                              // Navigator.pushNamed(context, AppRoutes.signup);
                            },
                          ),
                        ],
                      ),
                      onTap: () {}),
                ),
              ],
            )));
  }
}

