import 'package:flutter/material.dart';

import 'base_controller.dart';

abstract class BaseView<T extends BaseController> extends GetResponsiveView<T> {
  BaseView({Key? key}) : super(key: key);

  @override
  final String? tag = null;
  @override
  T get controller => GetInstance().find<T>(tag: tag);

  @override
  Widget builder() {
    return GetBuilder<T>(
      builder: (controller) {
        if (screen.isDesktop || screen.isTablet) {
          return viewDesktopBuilder();
        }
        return viewMobileBuilder();
      },
    );
  }

  Widget viewDesktopBuilder();

  Widget viewMobileBuilder();
}
