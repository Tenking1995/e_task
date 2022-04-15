import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import 'getxReferFolder/common/app_string.dart';
import 'getxReferFolder/common/app_themes.dart';
import 'getxReferFolder/common/app_translations.dart';
import 'getxReferFolder/pages.dart';
import 'getxReferFolder/router_name.dart';
import 'getxReferFolder/views/my_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppString.fetchApiData,
      // theme: ThemeData(
      //   primarySwatch: AppColor.primary,
      // ),
      debugShowCheckedModeBanner: false,
      home: MyView(),
      // theme: AppThemes.theme(),
      // darkTheme: AppThemes.darkTheme(),
      themeMode: AppThemes().init(),
      locale: AppTranslations.locale,
      fallbackLocale: AppTranslations.fallbackLocale,
      translations: AppTranslations(),
      // * initialBinding: Use binding to achieve loose coupling between controller and view, means no need create controller in view
      // * or
      // * in main.dart main() add AllControllersBinding().dependencies before runApp
      // initialBinding: SplashBinding(),
      initialRoute: RouterName.splash,
      getPages: Pages.pages(),
      // unknownRoute: Pages.unknownPage(),
      // scrollBehavior: CustomScrollBehavior(),
      defaultTransition: Transition.leftToRightWithFade,
    );

    // return MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider(create: (ctx) => Auth()),
    //     ChangeNotifierProxyProvider<Auth, Tasks>(
    //       create: (context) => Tasks(null, null, []),
    //       update: (context, auth, previousTasks) {
    //         return Tasks(auth.token, auth.userId, previousTasks == null ? [] : previousTasks.taskList);
    //       },
    //     ),
    //   ],
    //   child: Consumer<Auth>(
    //     builder: (ctx, auth, _) => MaterialApp(
    //       title: 'MyApp',
    //       theme: ThemeData(
    //         // primarySwatch: Colors.purple,
    //         colorScheme: Theme.of(context).colorScheme.copyWith(primary: Colors.blue[300], secondary: Colors.blue[700]),
    //         fontFamily: 'Lato',
    //       ),
    //       home: auth.isAuth
    //           ? const HomeScreen()
    //           : FutureBuilder(
    //               future: auth.tryAutoLogin(),
    //               builder: (ctx, authResultSnapshot) => authResultSnapshot.connectionState == ConnectionState.waiting
    //                   ? const SplashScreen()
    //                   : const AuthScreen(),
    //             ),
    //       routes: {
    //         TaskDetailsScreen.routeName: (context) => const TaskDetailsScreen(),
    //         ManageTasksScreen.routeName: (context) => const ManageTasksScreen(),
    //         EditTaskScreen.routeName: (context) => const EditTaskScreen(),
    //         AuthScreen.routeName: (context) => const AuthScreen(),
    //       },
    //     ),
    //   ),
    // );
  }
}
