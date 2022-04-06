import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'base_common_widgets.dart';
export 'package:get/get.dart';

class BaseController extends GetxController with BaseCommonWidgets/** Repositories */ {
  final box = GetStorage();
  bool isLoadMore = false;

  @override
  void onInit() {
    super.onInit();
  }

  void onRefresh() {}

  void onLoadMore() {}

  void back() {
    Get.back(result: false);
  }
}
