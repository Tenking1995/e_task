
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseCommonWidgets implements _CommonWidgetsInterface {
  @override
  void showSnackBar({String title = "", String message = ""}) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.black45,
      barBlur: 8.0,
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.only(
        bottom: 10.0,
        left: 10.0,
        right: 10.0,
      ),
      duration: Duration(seconds: 1),
    );
  }

  @override
  void showErrorSnackBar({String title = "", String message = ""}) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Color(0x8AD32F2F),
      barBlur: 10.0,
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.only(
        bottom: 10.0,
        left: 10.0,
        right: 10.0,
      ),
      duration: Duration(seconds: 2),
      icon: Icon(
        Icons.error,
        color: Colors.white,
      ),
    );
  }

  @override
  void showSuccessSnackBar({String title = "", String message = ""}) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Color(0x8A2E7D32),
      barBlur: 10.0,
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.only(
        bottom: 10.0,
        left: 10.0,
        right: 10.0,
      ),
      duration: Duration(seconds: 2),
      icon: Icon(
        Icons.check_circle,
        color: Colors.white,
      ),
    );
  }

  @override
  void showSimpleSnackBar({String message = ""}) {
    Get.showSnackbar(
      GetBar(
        messageText: Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  void showSimpleErrorSnackBar({String message = ""}) {
    Get.showSnackbar(
      GetBar(
        backgroundColor: Colors.red,
        icon: Icon(
          Icons.error,
          color: Colors.white,
        ),
        messageText: Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(seconds: 3),
      ),
    );
  }

  @override
  void showSimpleSuccessSnackBar({String message = ""}) {
    Get.showSnackbar(
      GetBar(
        backgroundColor: Colors.green,
        icon: Icon(
          Icons.check_circle,
          color: Colors.white,
        ),
        messageText: Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(seconds: 3),
      ),
    );
  }

  void showAlert({
    String title = "Alert",
    String content = "Alert",
    String? button,
    VoidCallback? buttonOnPressed,
    String? button2,
    VoidCallback? button2OnPressed,
    bool barrierDismissible = true,
  }) {
    // if (Utilities().isWeb() || (!Utilities().isWeb() && Platform.isIOS)) {
    //   Get.dialog(
    //     CupertinoAlertDialog(
    //       title: Text(title),
    //       content: Text(content),
    //       actions: [
    //         if (button != null)
    //           CupertinoDialogAction(
    //             child: Text(button),
    //             onPressed: () {
    //               hideDialog();
    //               if (buttonOnPressed != null) buttonOnPressed();
    //             },
    //           ),
    //         if (button2 != null)
    //           CupertinoDialogAction(
    //             child: Text(button2),
    //             onPressed: () {
    //               hideDialog();
    //               if (button2OnPressed != null) button2OnPressed();
    //             },
    //           ),
    //       ],
    //     ),
    //     barrierDismissible: barrierDismissible,
    //   );
    // } else {
    //   Get.dialog(
    //     AlertDialog(
    //       title: Text(title),
    //       content: Text(content),
    //       actions: [
    //         if (button != null)
    //           TextButton(
    //             child: Text(button),
    //             onPressed: () {
    //               hideDialog();
    //               if (buttonOnPressed != null) buttonOnPressed();
    //             },
    //           ),
    //         if (button2 != null)
    //           TextButton(
    //             child: Text(button2),
    //             onPressed: () {
    //               hideDialog();
    //               if (button2OnPressed != null) button2OnPressed();
    //             },
    //           ),
    //       ],
    //     ),
    //     barrierDismissible: barrierDismissible,
    //   );
    // }
  }

  // @override
  // void showAlert({
  //   String title = "Alert",
  //   TextStyle? titleStyle,
  //   Widget? content,
  //   VoidCallback? onConfirm,
  //   VoidCallback? onCancel,
  //   VoidCallback? onCustom,
  //   Color? cancelTextColor,
  //   Color? confirmTextColor,
  //   String? textConfirm,
  //   String? textCancel,
  //   String? textCustom,
  //   Widget? confirm,
  //   Widget? cancel,
  //   Widget? custom,
  //   Color? backgroundColor,
  //   bool barrierDismissible = true,
  //   Color? buttonColor,
  //   String middleText = "Dialog made in 3 lines of code",
  //   TextStyle? middleTextStyle,
  //   double radius = 20.0,
  //   List<Widget>? actions,
  //   WillPopCallback? onWillPop,
  // }) {
  //   Get.defaultDialog(
  //     title: title,
  //     titleStyle: titleStyle,
  //     content: content,
  //     onConfirm: onConfirm,
  //     onCancel: onCancel,
  //     onCustom: onCustom,
  //     cancelTextColor: cancelTextColor,
  //     confirmTextColor: confirmTextColor,
  //     textConfirm: textConfirm,
  //     textCancel: textCancel,
  //     textCustom: textCustom,
  //     confirm: confirm,
  //     cancel: cancel,
  //     custom: custom,
  //     backgroundColor: backgroundColor,
  //     barrierDismissible: barrierDismissible,
  //     buttonColor: buttonColor,
  //     middleText: middleText,
  //     middleTextStyle: middleTextStyle,
  //     radius: radius,
  //     actions: actions,
  //     onWillPop: onWillPop,
  //   );
  // }

  @override
  void showLoadingDialog() {
    Get.dialog(
      Material(
        color: Colors.black26,
        child: Center(
          child: Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: CircularProgressIndicator(),
          ),
        ),
      ),
      barrierDismissible: false,
      name: "Loading Dialog",
    );
  }

  @override
  void hideDialog() {
    if (Get.isDialogOpen ?? true) Get.back();
  }

  @override
  void showDebug() {}
}

abstract class _CommonWidgetsInterface {
  void showSnackBar({String title = "", String message = ""});

  void showErrorSnackBar({String title = "", String message = ""});

  void showSuccessSnackBar({String title = "", String message = ""});

  void showSimpleSnackBar({String message = ""});

  void showSimpleErrorSnackBar({String message = ""});

  void showSimpleSuccessSnackBar({String message = ""});

  void showAlert({
    String title = "Alert",
    String content = "Alert",
    bool barrierDismissible = true,
    String? button,
    VoidCallback? buttonOnPressed,
    String? button2,
    VoidCallback? button2OnPressed,
  });

  // void showAlert({
  //   String title = "Alert",
  //   TextStyle? titleStyle,
  //   Widget? content,
  //   VoidCallback? onConfirm,
  //   VoidCallback? onCancel,
  //   VoidCallback? onCustom,
  //   Color? cancelTextColor,
  //   Color? confirmTextColor,
  //   String? textConfirm,
  //   String? textCancel,
  //   String? textCustom,
  //   Widget? confirm,
  //   Widget? cancel,
  //   Widget? custom,
  //   Color? backgroundColor,
  //   bool barrierDismissible = true,
  //   Color? buttonColor,
  //   String middleText = "Dialog made in 3 lines of code",
  //   TextStyle? middleTextStyle,
  //   double radius = 20.0,
  //   List<Widget>? actions,
  //   WillPopCallback? onWillPop,
  // });

  void showLoadingDialog();

  void hideDialog();

  void showDebug();
}
