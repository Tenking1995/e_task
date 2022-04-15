import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../base/base_view.dart';
import '../controllers/my_controller.dart';

// class MyView extends StatelessWidget {
class MyView extends BaseView<
    MyController> /* can extend getView as well, GetResponsiveView can use for identity the current device type like phone or tablet or desktop */ {
  var storage = GetStorage();

  MyView({Key? key}) : super(key: key);
  // GetStorage g = GetStorage('MyStorage');

  void myStorageFunction() {
    // * check email format valid or not
    GetUtils.isEmail('tenk@gmail.com');
    // * store data(String, int, double, List, Map)
    storage.write('email', "MyEmail@gmail.com");
    // * read data
    var myEmail = storage.read('email');
    // * remove data
    storage.remove('email');
    // * erase your container:
    storage.erase();
    // * listen changes
    var listen = storage.listen(() {
      if (kDebugMode) {
        print('email changed');
      }
    });
    storage.listenKey('key', (value) {
      if (kDebugMode) {
        print('new key is $value');
      }
    });
    // * need dispose when no need
    // storage.removeListen(listen);

    // * use controller when extend GetResponsiveView
    var tmp = controller.isLoading;
  }

  // * Simple declare global controller
  // MyController myController = Get.put(MyController());

  // * Alive throughout the app; singleton(only 1 instance will be created) = true
  // MyController myController = Get.put(MyController(), permanent: true);
  // * or similar but singleton = false (will have multiple instance)
  //  Get.create<MyController>(() => MyController());

  // * when calling the controller instance, find it with the "tag". example at below
  // MyController myController = Get.put(MyController(), tag: 'MyControllerTag');

  // * Only Initialized when needed; singleton = true
  // * fenix = similar to permanent but will discarded when not being use and recreate when need again
  //  Get.lazyPut(() => MyController());
  //  Get.lazyPut(() => MyController(), tag: 'MyControllerTag', fenix: true);

  // * Use putAsync To perform some asyncronous operations
  // Get.putAsync<MyController>(() => await MyController());

  @override
  Widget viewDesktopBuilder() {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(title: const Text('My Scaffold Title')),
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  labelText: 'Email',
                  prefixIcon: const Icon(Icons.email),
                ),
              ),
              // * Simple observable
              // Obx(
              //   () =>
              //   // Text("Name: ${myController.student.name}"),
              //   Text("Name: ${myController.student.value.name}"),
              // ),
              // const SizedBox(height: 10),
              // ElevatedButton(
              //   child: const Text("Convert"),
              //   onPressed: () {
              //     myController.convertToUpperCase();
              //   },
              // ),
              // * Reactive State Manager || update
              // GetX<MyController>(
              //   init: MyController(),
              // * use better approach like onInit() in controller
              //   // initState: (data) => Get.find<MyController>().increment(),
              // * use better approach like onClose() in controller
              //   // dispose: (_) => Get.find<MyController>().dispose(),
              //   builder: (controller) {
              //     // return Text("Name: ${myController.count}");
              //     return Text("Name: ${controller.count}");
              //   },
              // ),
              // const SizedBox(height: 10),
              // ElevatedButton(
              //   child: const Text("Convert"),
              //   onPressed: () {
              //     // * Update
              //     // myController.increment();
              //     // Get.find<MyController>().increment();
              //     // * if initState style no need to declare
              //   },
              // ),
              // * GetX Unique ID inorder to trigger change only for this id component/GetBuilder
              // GetBuilder<MyController>(
              //   id: 'txtCount',
              //   builder: (controller) {
              //     return Text("Name: ${controller.count}");
              //   },
              // ),
              // * Change Translation
              // Text('Hello'.tr),
              // ElevatedButton(
              //   child: const Text("Change to Chinese"),
              //   onPressed: () {
              //     Get.find<MyController>().changeLanguage('zh', 'CH');
              //   },
              // ),
              // * find controller with "Tag"
              // Get.find<MyController>(tag: 'MyControllerTag');

              // * obx provided by Mixin
              // body: controller.obx(
              //   (data) => Container(child: Text(data[0]['name'])),
              //   onError: (err) => Center(child: Text(err ?? '')),
              // ),

              // * genrate qr Image
              QrImage(
                data: 'xxx',
                size: 200,
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget viewMobileBuilder() {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(title: const Text('My Scaffold Title')),
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  labelText: 'Email',
                  prefixIcon: const Icon(Icons.email),
                ),
              ),
              // * Simple observable
              // Obx(
              //   () =>
              //   // Text("Name: ${myController.student.name}"),
              //   Text("Name: ${myController.student.value.name}"),
              // ),
              // const SizedBox(height: 10),
              // ElevatedButton(
              //   child: const Text("Convert"),
              //   onPressed: () {
              //     myController.convertToUpperCase();
              //   },
              // ),
              // * Reactive State Manager || update
              // GetX<MyController>(
              //   init: MyController(),
              // * use better approach like onInit() in controller
              //   // initState: (data) => Get.find<MyController>().increment(),
              // * use better approach like onClose() in controller
              //   // dispose: (_) => Get.find<MyController>().dispose(),
              //   builder: (controller) {
              //     // return Text("Name: ${myController.count}");
              //     return Text("Name: ${controller.count}");
              //   },
              // ),
              // const SizedBox(height: 10),
              // ElevatedButton(
              //   child: const Text("Convert"),
              //   onPressed: () {
              //     // * Update
              //     // myController.increment();
              //     // Get.find<MyController>().increment();
              //     // * if initState style no need to declare
              //   },
              // ),
              // * GetX Unique ID inorder to trigger change only for this id component/GetBuilder
              // GetBuilder<MyController>(
              //   id: 'txtCount',
              //   builder: (controller) {
              //     return Text("Name: ${controller.count}");
              //   },
              // ),
              // * Change Translation
              // Text('Hello'.tr),
              // ElevatedButton(
              //   child: const Text("Change to Chinese"),
              //   onPressed: () {
              //     Get.find<MyController>().changeLanguage('zh', 'CH');
              //   },
              // ),
              // * find controller with "Tag"
              // Get.find<MyController>(tag: 'MyControllerTag');

              // * obx provided by Mixin
              // body: controller.obx(
              //   (data) => Container(child: Text(data[0]['name'])),
              //   onError: (err) => Center(child: Text(err ?? '')),
              // ),

              // * genrate qr Image
              QrImage(
                data: 'xxx',
                size: 200,
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
