import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/auth.dart';
import 'providers/tasks.dart';
import 'screens/auth_screen.dart';
import 'screens/edit_task_screen.dart';
import 'screens/home_screen.dart';
import 'screens/manage_tasks_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/task_details_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return GetMaterialApp(
    //   title: "My Getx E-TASK",
    //   locale: AppTranslations.locale,
    //   fallbackLocale: AppTranslations.fallbackLocale,
    //   translations: AppTranslations(),
    //   home: Scaffold(
    //     appBar: AppBar(title: const Text('Scaffold AppBar E-Task')),
    //     body: Center(
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         children: [
    //           ElevatedButton(
    //             child: Text(
    //               "Show Snackbar",
    //               style: GoogleFonts.lato(fontSize: 20),
    //             ),
    //             onPressed: () {
    //               GetxFeatures().showCustomSnackbar();
    //             },
    //           ),
    //           const SizedBox(
    //             height: 10,
    //           ),
    //           ElevatedButton(
    //             child: const Text("Show Dialog"),
    //             onPressed: () {
    //               GetxFeatures().showCustomDialog();
    //             },
    //           ),
    //           const SizedBox(
    //             height: 10,
    //           ),
    //           ElevatedButton(
    //             child: const Text("Show Botom Sheet"),
    //             onPressed: () {
    //               GetxFeatures().showBottomSheet();
    //             },
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => Auth()),
        ChangeNotifierProxyProvider<Auth, Tasks>(
          create: (context) => Tasks(null, null, []),
          update: (context, auth, previousTasks) {
            return Tasks(auth.token, auth.userId, previousTasks == null ? [] : previousTasks.taskList);
          },
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          title: 'MyApp',
          theme: ThemeData(
            // primarySwatch: Colors.purple,
            colorScheme: Theme.of(context).colorScheme.copyWith(primary: Colors.blue[300], secondary: Colors.blue[700]),
            fontFamily: 'Lato',
          ),
          home: auth.isAuth
              ? const HomeScreen()
              : FutureBuilder(
                  future: auth.tryAutoLogin(),
                  builder: (ctx, authResultSnapshot) => authResultSnapshot.connectionState == ConnectionState.waiting
                      ? const SplashScreen()
                      : const AuthScreen(),
                ),
          routes: {
            TaskDetailsScreen.routeName: (context) => const TaskDetailsScreen(),
            ManageTasksScreen.routeName: (context) => const ManageTasksScreen(),
            EditTaskScreen.routeName: (context) => const EditTaskScreen(),
            AuthScreen.routeName: (context) => const AuthScreen(),
          },
        ),
      ),
    );
  }
}
