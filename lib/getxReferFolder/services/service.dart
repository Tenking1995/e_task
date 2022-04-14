import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

// * class extended GetxService same like standard GetxController
// * share same lifecycle : onInit, onReady, onClose and it just notify getx dependency injection system
// * different from GetxController is this class cannot be removed from memory
class Service extends GetxService {
  Future<void> incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter = (prefs.getInt('counter') ?? 0) + 1;
    await prefs.setInt('counter', counter);
  }
}

// * Example at main view
Future<void> main() async {
  await initService();
  runApp(const MyApp());
}

Future<void> initService() async {
  if (kDebugMode) {
    print('starting services ...');
  }
  await Get.putAsync<Service>(() async => Service());
  if (kDebugMode) {
    print('Al services started ...');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('Click'),
      onPressed: () {
        Get.find<Service>().incrementCounter();
      },
    );
  }
}
