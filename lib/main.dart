import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'common/app_color.dart';
import 'screens/bottom_nav_bar_screen.dart';

void main() {
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Material(
      child: Container(
        color: AppColor.primary,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            details.exception.toString(),
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: AppColor.white,
            ),
          ),
        ]),
      ),
    );
  };
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      title: 'Blogs',
      theme: ThemeData(
        // primarySwatch: Colors.purple,
        colorScheme: Theme.of(context).colorScheme.copyWith(primary: Colors.blue[900], secondary: Colors.blue[300]),
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
        // fontFamily: 'Roboto',
        // textTheme: const TextTheme(
        //   headline5: TextStyle(fontSize: 30.0, fontStyle: FontStyle.italic),
        //   headline6: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
        //   bodyText2: TextStyle(fontSize: 15.0),
        // ),
        splashColor: Colors.transparent,
      ),
      home: const BottomNavigationBarScreen(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          default:
            return null;
        }
      },
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
