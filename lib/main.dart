import 'package:e_task/providers/tasks.dart';
import 'package:e_task/screens/edit_task_screen.dart';
import 'package:e_task/screens/home_screen.dart';
import 'package:e_task/screens/manage_tasks_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/auth.dart';
import 'screens/auth_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/task_details_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          title: 'ETask',
          theme: ThemeData(
            // primarySwatch: Colors.purple,
            colorScheme: Theme.of(context).colorScheme.copyWith(primary: Colors.blue[300], secondary: Colors.blue[700]),
            fontFamily: 'Lato',
          ),
          home: auth.isAuth
              ? HomeScreen()
              : FutureBuilder(
                  future: auth.tryAutoLogin(),
                  builder: (ctx, authResultSnapshot) =>
                      authResultSnapshot.connectionState == ConnectionState.waiting ? const SplashScreen() : AuthScreen(),
                ),
          routes: {
            TaskDetailsScreen.routeName: (context) => TaskDetailsScreen(),
            ManageTasksScreen.routeName: (context) => ManageTasksScreen(),
            EditTaskScreen.routeName: (context) => EditTaskScreen(),
            AuthScreen.routeName: (context) => AuthScreen(),
          },
        ),
      ),
    );
  }
}
