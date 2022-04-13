import 'package:my_app/providers/blogs.dart';
import 'package:my_app/screens/home_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'application.dart';
import 'screens/blog_details_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Blogs>(
          create: (context) => Blogs([]),
        ),
      ],
      child: MaterialApp(
        scrollBehavior: MyCustomScrollBehavior(),
        title: 'Blogs',
        theme: ThemeData(
          // primarySwatch: Colors.purple,
          colorScheme: Theme.of(context).colorScheme.copyWith(primary: Colors.blue[900], secondary: Colors.blue[300]),
          fontFamily: 'Lato',
          textTheme: const TextTheme(
            headline5: TextStyle(fontSize: 30.0, fontStyle: FontStyle.italic),
            headline6: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            bodyText2: TextStyle(fontSize: 15.0),
          ),
        ),
        home: const HomeScreen(),
        // routes: {
        //   BlogDetailsScreen.routeName: (context) => const BlogDetailsScreen(),
        // },
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case BlogDetailsScreen.routeName:
              // return PageTransition(
              //   child: const BlogDetailsScreen(),
              //   type: Application.defaultPageTransition,
              //   duration: Application.defaultPageTransitionStartDuration,
              //   settings: settings,
              // );
              return PageRouteBuilder(
                  settings: settings, // Pass this to make popUntil(), pushNamedAndRemoveUntil(), works
                  pageBuilder: (_, __, ___) => const BlogDetailsScreen(),
                  transitionsBuilder: (_, a, __, c) => Application.getDefaultPageTransition(a, c));
            default:
              return null;
            // return MaterialPageRoute(builder: (_) => UnknownPage());
          }
        },
      ),
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
