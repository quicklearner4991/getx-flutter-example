import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_flutter_example/routes/app_pages.dart';
import 'package:getx_flutter_example/theme/app_theme.dart';
import 'package:getx_flutter_example/translations/app_translations.dart';
import 'package:getx_flutter_example/utils/AppConstants.dart';

Future<void> main() async {
  await GetStorage.init();
  GetStorage storage = GetStorage();
  var isLoggedIn = await storage.read(AppConstants.IS_LOGGED_IN);
  if (isLoggedIn!=null){
    print(isLoggedIn);
  }
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.INITIAL,
    theme: appThemeData,
    defaultTransition: Transition.fade,
    getPages: AppPages.pages,
    locale: const Locale('en', 'US'),
    translationsKeys: AppTranslation.translations,
  ));
}
