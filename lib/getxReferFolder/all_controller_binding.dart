import 'package:get/get.dart';

import 'controllers/my_controller.dart';

class AllControllersBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyController>(() => MyController());
    // ...
  }
  
}