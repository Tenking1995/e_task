import 'package:e_task/getxReferFolder/views/my_view.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';

import 'common/app_color.dart';
import 'common/app_string.dart';

Future<void> main() async {
  await GetStorage.init();
  // await GetStorage.init('MyStorage');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // * more features and references can refer to getx_features.dart file
    return GetMaterialApp(
      title: AppString.fetchApiData,
      theme: ThemeData(
        primarySwatch: AppColor.primary,
      ),
      debugShowCheckedModeBanner: false,
      home: MyView(),
      // theme: AppThemes.theme(),
      // darkTheme: AppThemes.darkTheme(),
      // themeMode: AppThemes().init(),
      // locale: AppTranslations.locale,
      // fallbackLocale: AppTranslations.fallbackLocale,
      // translations: AppTranslations(),
      // initialBinding: SplashBinding(),
      // initialRoute: RouterName.splash,
      // debugShowCheckedModeBanner: false,
      // getPages: Pages.pages(),
      // unknownRoute: Pages.unknownPage(),
      // scrollBehavior: CustomScrollBehavior(),
    );
  }
}