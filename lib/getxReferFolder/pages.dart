import 'package:get/get_navigation/src/routes/get_route.dart';

import '../utilities/application_utils.dart';

class Pages {
  static List<GetPage> pages() {
    bool isWeb = ApplicationUtils().isWeb();
    return [
      // GetPage(
      //   name: RouterName.splash,
      //   page: () {
      //     if (isWeb) return SplashWebScreen();
      //     return SplashScreen();
      //   },
      //   binding: SplashBinding(),
      //   transition: Transition.rightToLeft,
      // ),
      // if (!AppConfigEnvironment.isProduction) ..._testingOnlyPageList,
    ];
  }

  // * added for DEV and STG environment only
  static List<GetPage> get _testingOnlyPageList {
    return [
      // GetPage(
      //   name: RouterName.form,
      //   page: () {
      //     if (Utilities().isWeb()) return FormWebScreen();
      //     return FormScreen();
      //   },
      //   binding: FormBinding(),
      // ),
    ];
  }

  // static GetPage unknownPage() {
  //   bool isWeb = Utilities().isWeb();
  //   return GetPage(
  //     name: RouterName.notFound,
  //     page: () {
  //       if (isWeb) return NotFoundWebScreen();
  //       return NotFoundScreen();
  //     },
  //     binding: NotFoundBinding(),
  //   );
  // }
}
