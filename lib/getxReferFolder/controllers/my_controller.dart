import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../models/product_model.dart';
import '../services/api_service.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put(WebPaymentLandingController());
    // Get.put(PaymentGatewayController(), permanent: true);
    Get.lazyPut(() => MyController());
    // * ApiService
    // Get.lazyPut(() => MyController(ProductsRepo(ApiProvider())));
  }
}

class MyController extends GetxController with StateMixin<List<ProductModel>? /* Based on api used model class */ > {
  var isLoading = true.obs;
  var productList = <ProductModel>[].obs;
  var internet = 0.obs;
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<Connectivity>? _connectivitySubscription;

  // * Api Service
  // ProductsRepo productsRepo;
  // MyController(this.productsRepo);
  // List<ProductModel> productsList = [];

  @override
  void onInit() {
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus) as StreamSubscription<Connectivity>?;

    // * normal api perform
    fetchProducts();

    // * with stateMixin and Getconnect
    // * in view use controller.obx ((data) => Container(...))
    ApiConnectService().fetchProducts().then((resp) {
      change(resp, status: RxStatus.success()); // * provided by stateMixin
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString())); // * provided by stateMixin
    });
    super.onInit();
  }

  @override
  void onReady() {
    // * Api Service
    getProducts();
    super.onReady();
  }

  void getProducts() async {
    // try {
    //   change(null, status: RxStatus.loading());
    //   productsRepo.getProducts("1").then((value) {
    //     productList.clear();
    //     productList.addAll(value);
    //     change(null, status: RxStatus.success());
    //   }, onError: (err) {
    //     change(null, status: RxStatus.error(err.toString()));
    //   });
    // } catch (e) {
    //   change(null, status: RxStatus.error(e.toString()));
    // }

    // * in main body
    // body: controller.obx(
    //   (state) => ListView.separated(
    //     padding: EdgeInsets.only(top: 8),
    //     physics: BouncingScrollPhysics(),
    //     itemBuilder: (ctx, index) {
    //       return ListTile(
    //         leading: Container(),
    //       );
    //     },
    //     separatorBuilder: (ctx, index) => Divider(color: Colors.grey),
    //     itemCount: state!.length,
    //   ),
    //   onLoading: SkeletonListView(),
    //   onError: (error) => Center(child: Text(error.toString()))
    // );
  }

  @override
  void onClose() {
    super.onClose();
    _connectivitySubscription?.cancel();
  }

  void initConnectivity() async {
    ConnectivityResult? connectivityResult;
    try {
      connectivityResult = _connectivity.checkConnectivity() as ConnectivityResult;
    } on PlatformException catch (e) {
      print(e);
    }
    _updateConnectionStatus(connectivityResult);
  }

  _updateConnectionStatus(ConnectivityResult? connectivityResult) {
    switch (connectivityResult) {
      case ConnectivityResult.bluetooth:
        break;
      case ConnectivityResult.wifi:
        break;
      case ConnectivityResult.ethernet:
        break;
      case ConnectivityResult.mobile:
        break;
      case ConnectivityResult.none:
      default:
        break;
    }
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await ApiService.fetchProducts();
      if (products != null) {
        productList.assignAll(products);
      }
    } finally {
      isLoading(false);
    }
  }

  // * reactive to object variable
  // var student = Student();
  // void convertToUpperCase() {
  //   student.name.value = student.name.value?.toUpperCase();
  // }

  // * reactive to an object
  // var student = Student(name: 'John', age: 25).obs;
  // void convertToUpperCase() {
  //   student.update((student) {
  //     student?.name = student.name.toString().toUpperCase();
  //   });
  // }

  // * Reactive State Manager
  // var count = 0.obs;
  // void increment() {
  //   count += 1;
  // }

  // * Update
  // var count = 0;
  // void increment() {
  //   count += 1;
  //   update();
  // }

  // * Update with GetX Unique ID
  // var count = 0;
  // void increment() {
  //   count += 1;
  //    update(['txtCount']);
  // }

  // * Trigger GetX Workers : trigger when value changed
  // var count = 0.obs;
  // void increment() {
  //   count += 1;
  // }
  // @override
  // void onInit() {
  //   super.onInit();
  // * trigger everytime when value changed
  //   ever(count, (_) => print(count));
  // * trigger everytime when any variables value in the list changed
  //   everAll([count], (_) => print(count));
  // * trigger once only when variable value changed
  //   once(count, (_) => print(count));
  // * trigger everytime when user stop typing for 1 inSeconds
  //   debounce(count, (_) => print(count), time: Duration(seconds: 1));
  // * ignore all changes within 3 secs
  // * after trigger then will cooldown 3 sec and only able trigger after that
  //   interval(count, (_) => print(count), time: Duration(seconds: 3));
  // }

  // * Change Text Translation
  // void changeLanguage(String param1, String param2) {
  //   var locale = Locale(param1, param2);
  //   Get.updateLocale(locale);
  // }

  // * Use putAsync To perform some asyncronous operations
  // void incrementCounter () async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   int counter = (prefs.getInt('counter') ?? 0) + 1;
  //   await prefs.setInt('counter', counter);
  // }

  // * remove all controllers
  // Get.reset();
}
