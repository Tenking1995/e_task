import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';
import 'package:my_test_package/my_test_package.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../screens/auth_screen.dart';
import '../screens/home_screen.dart';
import '../screens/task_details_screen.dart';
import './global_translations.dart';
import 'AllControllersBinding.dart';
import 'controllers/my_controller.dart';
import 'views/my_view.dart';

class GetxFeatures extends GetxController {
  Widget tmp = getMyButton();

  void showCustomSnackbar() {
    Get.snackbar(
      "Get SnackBar title", "Get SnackBar message",
      colorText: Colors.red,
      titleText: const Text("titleText", style: TextStyle(color: Colors.black)),
      messageText: Text(
        "messageText",
        style: TextStyle(color: Colors.grey[700]),
      ),
      mainButton: TextButton(
        child: const Text('Undo'),
        style: TextButton.styleFrom(
          primary: Colors.red,
          backgroundColor: Colors.blue,
        ),
        onPressed: () {},
      ),
      duration: const Duration(seconds: 2),
      animationDuration: const Duration(milliseconds: 300),
      snackPosition: SnackPosition.BOTTOM,
      // backgroundColor: Colors.black.withOpacity(0.3),
      backgroundGradient: const LinearGradient(
        colors: [Colors.blue, Colors.white],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      borderRadius: 10,
      borderColor: Colors.blue[400],
      borderWidth: 1,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      isDismissible: true,
      icon: const Icon(
        Icons.account_balance_wallet_rounded,
        color: Colors.black,
      ),
      shouldIconPulse: false, // close icon animation
      onTap: (value) {},
      overlayBlur: 5,
      overlayColor: Colors.grey.withOpacity(0.3),
      // showProgressIndicator: true,
      // forwardAnimationCurve: Curves.bounceInOut
      // boxShadows: [
      //   BoxShadow(
      //     color: Colors.blue,
      //     offset: Offset(0, 50),
      //     spreadRadius: 15,
      //     blurRadius: 10,
      //   )
      // ]
    );
  }

  void showCustomDialog() {
    Get.defaultDialog(
        title: 'defaultDialogTitle',
        titleStyle: const TextStyle(color: Colors.white),
        middleText: 'defaultDialogMiddleText',
        middleTextStyle: const TextStyle(color: Colors.black),
        backgroundColor: Colors.blue,
        radius: 10,
        content: Center(
          child: Column(
            children: const [
              CircularProgressIndicator(),
              SizedBox(height: 10),
              Text(
                'content text',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        textCancel: 'Cancel Now',
        cancelTextColor: Colors.white,
        textConfirm: 'Confirm Now',
        confirmTextColor: Colors.yellow,
        onCancel: () {},
        onConfirm: () {},
        buttonColor: Colors.blue,
        cancel: const Text(
          "Custom Cancel",
          style: TextStyle(color: Colors.green),
        ),
        confirm: const Text(
          "Custom Confirm",
          style: TextStyle(color: Colors.purple),
        ),
        actions: [
          ElevatedButton(
            child: const Text('ElevatedButton'),
            onPressed: () {},
          )
        ]);
  }

  void showBottomSheet() {
    Get.bottomSheet(
      Container(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.ac_unit_outlined),
              title: const Text('Listile 1'),
              onTap: () {
                Get.changeTheme(ThemeData.light());
              },
            ),
            ListTile(
              leading: const Icon(Icons.accessible),
              title: const Text('Listile 2'),
              onTap: () {
                Get.changeTheme(ThemeData.dark());
              },
            ),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        // side: BorderSide(
        //   color: Colors.green,
        //   style: BorderStyle.solid,
        //   width: 1,
        // ),
      ),
      barrierColor: Colors.grey.withOpacity(0.3),
      backgroundColor: Colors.white,
      isDismissible: true,
      // enableDrag: true
    );
  }

  void routeWithUnNamedRoutes() {
    Get.to(
      TaskDetailsScreen(),
      // fullscreenDialog: true, //open with dialog style (top left is cancel button instead of back button)
      transition: Transition.leftToRight,
      duration: const Duration(microseconds: 400),
      curve: Curves.bounceInOut, // Curve Animation
    );

    // * Go to next screen but no option to return  to prev screen
    // Get.off(TaskDetailsScreen(),);

    // * Go to next screen and cancel all prev screens/routes
    // Get.offAll(TaskDetailsScreen(),);

    // * Go to next screen with pass some datas
    // Get.to(TaskDetailsScreen(), arguments:'DATA HERE');

    // * Receive data from prev screen
    // Get.arguments;

    // * Pass back data to prev screen
    // var waitData = await Get.to(TaskDetailsScreen(),);
    // * at next screen pass back with
    // Get.back(result: 'This is the return data');
  }

  // * GetMaterialApp related Getx Features
  void routeWithNamedRoutes() {
    // * Init all routes in GetMaterialApp
    GetMaterialApp(
      // * initialBinding: Use binding to achieve loose coupling between controller and view, means no need create controller in view
      // * or
      // * in main.dart main() add AllControllersBinding().dependencies before runApp
      // initialBinding: AllControllersBinding(),
      title: "GetMaterialApp title",
      initialRoute: '/',
      unknownRoute: GetPage(name: '/notFound', page: () => AuthScreen()),
      defaultTransition: Transition.leftToRightWithFade,
      getPages: [
        // GetPage(name: '/', page: () => MyApp()),
        GetPage(name: '/home', page: () => HomeScreen()),
        GetPage(
          name: '/Task',
          page: () => TaskDetailsScreen(),
          transition: Transition.rightToLeft,
        ),
        // * No need declare one by one if using initialBinding for "binding"
        // GetPage(
        //   name: '/Task',
        //   page: () => MyView(),
        //   binding: MyController(),
        // ),
        // * Use Binding builder if we dont want use seperate binding class and use multiple controllers in the MyControllerBinding
        // GetPage(
        //   name: '/Task',
        //   page: () => MyView(),
        //   binding: BindingBuilder(() => {Get.lazyPut<MyControllerBinding>(() => MyControllerBinding())}),
        // ),
        // * Pass the data to next screen in url format and can retrive the data in next screen params
        // GetPage(
        //   name: '/Task/:valueVariable', // * valueVariable = identity/tag
        //   page: () => TaskDetailsScreen(),
        // ),
        // * at any screen route with this style and
        // Get.toNamed('/Task/myDataHere');
        // * at next screen in url format and can retrive the data in next screen params
        // Get.parameters['valueVariable'];
      ],
      translations: GlobalTranslations(), // * Text translation class
      locale: const Locale('en', 'US'), // * Note: To get device local use "Get.deviceLocale"
      fallbackLocale: const Locale('en', 'US'),
    );

    // * route and with controller binding
    // Get.to(Home(), binding: HomeControllerBinding());

    // * Go to next screen but no option to return  to prev screen
    // Get.off('/home');

    // * Go to next screen and cancel all prev screens/routes
    // Get.offAll('/home');

    // * Dynamically URL links
    // Get.toNamed('/home?channel=RipplesCode&content=FlutterGetx');

    // * Retrieve data from Dynamically URL links paramters
    // var channel = Get.parameters['channel'];
    // var content = Get.parameters['content'];

    // * Change Translation
  }

  void routeBack() {
    Get.back();

    // * give the current args from currentScreen
    Get.arguments;

    // * give name of previous route
    Get.previousRoute;

    // * give the raw route to access for example, rawRoute.isFirst()
    Get.rawRoute;

    // * give access to Routing API from GetObserver
    Get.routing;

    // * check if snackbar is open
    Get.isSnackbarOpen;

    // * check if dialog is open
    Get.isDialogOpen;

    // * check if bottomsheet is open
    Get.isBottomSheetOpen;

    // * remove one route.
    // Get.removeRoute();

    // * back repeatedly until the predicate returns true.
    // Get.until();

    // * go to next route and remove all the previous routes until the predicate returns true.
    // Get.offUntil();

    // * go to next named route and remove all the previous routes until the predicate returns true.
    // Get.offNamedUntil();

    //Check in what platform the app is running
    GetPlatform.isAndroid;
    GetPlatform.isIOS;
    GetPlatform.isMacOS;
    GetPlatform.isWindows;
    GetPlatform.isLinux;
    GetPlatform.isFuchsia;

    //Check the device type
    GetPlatform.isMobile;
    GetPlatform.isDesktop;
    //All platforms are supported independently in web!
    //You can tell if you are running inside a browser
    //on Windows, iOS, OSX, Android, etc.
    GetPlatform.isWeb;

    // Equivalent to : MediaQuery.of(context).size.height,
    // but immutable.
    Get.height;
    Get.width;

    // Gives the current context of the Navigator.
    Get.context;

    // Gives the context of the snackbar/dialog/bottomsheet in the foreground, anywhere in your code.
    Get.overlayContext;

    /// Similar to MediaQuery.of(context).orientation;
    Get.context?.orientation;

    /// Check if device is on landscape mode
    Get.context?.isLandscape;

    /// Check if device is on portrait mode
    Get.context?.isPortrait;
  }

  // * State Management
  void observableValue() {
    // * observe with RX(Type)
    // final name = RxString('');
    // final isLogged = RxBool(false);
    // final price = RxInt(0);
    // final list = RxList<String>();
    // final map = RxMap<String, String>();

    // * observe with Dart Generics, Rx(Type)
    // final name2 = Rx<String>('');
    // final isLogged2 = Rx<bool>(false);
    // final price2 = Rx<int>(0);
    // final list2 = Rx<List<String>>([]);
    // final map2 = Rx<Map<String, String>>({});
    // final object = Rx<User>({});

    // * In View
    // var count = 0.obs;

    // void increments() {
    //   count += 1;
    // }

    // Obx(() => Text('Current Number: $count'));

    // * Observe an Object || variable in Object
    // class User {

    // * 1st: --------------------------------------
    // * Observe variable in an Object
    // final name = Rxn<String>(); // nullable
    // final age = Rx<int>(0);
    // * In View
    // var user = User();
    // ${user.name.value}
    // * eg need to change: user.name.value = John;

    // * 2nd: --------------------------------------
    // * Observe entire Object
    // final name;
    // var age;
    // User({this.name, this.age});
    // * In View
    // var user = User().obs;
    // ${user.value.name}
    // * make update
    // user.update((user) {
    //   user.name = user.name.toString().toUpperCase();
    // });
    // }
  }

  void getAllBiometrics() async {
    // * 1st setup some code in ios info.plist and android main.class and androidmanifest file
    var _localAuth = LocalAuthentication();
    var hasFingerprint = false.obs;
    var hasFaceLock = false.obs;
    var isUserAuthenticated = false.obs;

    // * check whether is the local auth availble on this device or not
    bool hasLocalAuthentication = await _localAuth.canCheckBiometrics;
    if (hasLocalAuthentication) {
      List<BiometricType> availableBiometrics = await _localAuth.getAvailableBiometrics();
      hasFaceLock.value = availableBiometrics.contains(BiometricType.face);
      hasFingerprint.value = availableBiometrics.contains(BiometricType.fingerprint);
    }

    // * use like:
    try {
      const androidMesage = AndroidAuthMessages(
        cancelButton: 'Cancel',
        goToSettingsButton: 'settings',
        goToSettingsDescription: 'Setup up fingerprint/face id now',
        biometricHint: 'Verify your identity',
      );
      isUserAuthenticated.value = await _localAuth.authenticate(
        localizedReason: 'Authenticate Yourself',
        biometricOnly: true,
        useErrorDialogs: true,
        stickyAuth: true,
        androidAuthStrings: androidMesage,
      );
    } catch (e) {}
  }

  // * scan qr code
  // * Set minimum deployment target to 12 and set Swift version to 5.
  // * Close the Xcode and run pod install in /ios in flutter project.
  // * add:
  // * <key>NSCameraUsageDescription</key>
  // * <string>Camera permission is required for barcode scanning.</string>
  Future<void> scanBarcode() async {
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode("#ff6666", "Cancel", false, ScanMode.QR);
    if (scanBarcode != '-1') {
      // got result
    }
  }

  void calldirectly() {
    // url_launcher
    // add to ios info-plist
    // <key>LSApplicationQueriesSchemes</key>
    // <array>
    //   <string>https</string>
    //   <string>http</string>
    // </array>
    // add to androidmanifest
    // <!-- If your app opens https URLs -->
    // <queries>
    //   <!-- If your app opens https URLs -->
    //   <intent>
    //     <action android:name="android.intent.action.VIEW" />
    //     <data android:scheme="https" />
    //   </intent>
    //   <!-- If your app makes calls -->
    //   <intent>
    //     <action android:name="android.intent.action.DIAL" />
    //     <data android:scheme="tel" />
    //   </intent>
    //   <!-- If your sends SMS messages -->
    //   <intent>
    //     <action android:name="android.intent.action.SENDTO" />
    //     <data android:scheme="smsto" />
    //   </intent>
    //   <!-- If your app sends emails -->
    //   <intent>
    //     <action android:name="android.intent.action.SEND" />
    //     <data android:mimeType="*/*" />
    //   </intent>
    // </queries>

    // or use
    // flutter_phone_direct_caller
    // add to ios info.plist
    // <key>LSApplicationQueriesSchemes</key>
    // <array>
    //   <string>tel</string>
    // </array>

    launch('tel:0192464769'); // show call page first instead of call directly
    // or
    // FlutterPhoneDirectCaller.callNumber('0192464769'); // call directly
  }

  void getLocation() async {
    // geoLocation
    // 1. Add the following to your "gradle.properties" file:
    // android.useAndroidX=true
    // android.enableJetifier=true
    // 2. Make sure you set the compileSdkVersion in your "android/app/build.gradle" file to 31:
    // android {
    //   compileSdkVersion 31

    //   ...
    // }
    // 3. AndroidManifest
    // <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
    // <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
    // 4. add also if want continue retrieving on background Only
    // <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION" />
    //IOS Part
    // add into info.plist
    // <key>NSLocationWhenInUseUsageDescription</key>
    // <string>This app needs access to location when open.</string>
    // <key>NSLocationAlwaysUsageDescription</key>
    // <string>This app needs access to location when in the background.</string>
    LocationPermission permission;
    //Test if location services  are enabled
    bool servicesEnabled = await Geolocator.isLocationServiceEnabled();
    if (!servicesEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permission are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      if (permission == LocationPermission.denied) {
        return Future.error('Location permission are permanently denied, we cannot request permissions.');
      }
    }

    double latitude = 0;
    double longitude = 0;
    late StreamSubscription<Position> streamSubscription;
    streamSubscription = Geolocator.getPositionStream().listen((postion) async {
      latitude = postion.latitude;
      longitude = postion.longitude;
      // from geocoding
      List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
      Placemark place = placemarks[0];
      var address = 'Address: ${place.subLocality}, ${place.country}';
    });
  }

  // Support android only
  void disableCapture() async {
    // flutter pub add flutter_windowmanager
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
    // OR IN ANDROID MAIN ONCREATE ADD
    // getWindow().addFlags(LayoutParams.FLAG_SECURE);
  }
}
