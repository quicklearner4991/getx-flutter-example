import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_flutter_example/theme/app_colors.dart';

import '../../controller/splash/splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashController _controller = Get.put(SplashController());
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      _controller.moveToNextScreen();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: exampleColor,
      height: double.infinity,
      width: double.infinity,
      child: const Center(
          child: SizedBox(
            height: 128,
            width: 128,
            child: Icon(Icons.account_balance_sharp),
          )),
    );
  }
}
