import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:package_info/package_info.dart';
import 'package:url_launcher/url_launcher.dart';

class ApplicationUtils {
  void callPhoneNumber({String phone = "0"}) async {
    launch("tel://$phone");
  }

  void intentOpenUrl(String s, {String link = "https://google.com"}) async {
    final url = link;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Could not launch $url";
    }
  }

  String formattedDateTime({String? format, String? date, String? newFormat}) {
    if (date == "null") {
      return "";
    }

    DateFormat dateFormat = DateFormat(format);
    DateTime dateTime = dateFormat.parse(date ?? "");

    String formattedDate = DateFormat(
      newFormat ?? "dd MMMM yyyy",
    ).format(dateTime);
    return formattedDate;
  }

  double roundUpNumber(double number, int size) {
    return double.parse((number).toStringAsFixed(size));
  }

  String getFormattedPrice(double? price) {
    if (price == null) {
      return "";
    }
    return price.toStringAsFixed(2);
  }

  String getFormattedDiscount(double? price) {
    if (price == null) {
      return "";
    }
    return price.toStringAsFixed(0);
  }

  Future<String> getAppName() async {
    if (isWeb()) return "";
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.appName;
  }

  Future<String> getAppPackageName() async {
    if (isWeb()) return "";
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.packageName;
  }

  Future<String> getAppVersion() async {
    if (isWeb()) return "";
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  Future<String> getAppBuildNumber() async {
    if (isWeb()) return "";
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.buildNumber;
  }

  // void logWhenDebug(String tag, String message) {
  //   if (kDebugMode) {
  //     if (isWeb()) {
  //       print("$tag => ${message.toString()}");
  //     } else {
  //       log(
  //         "$tag => ${message.toString()}",
  //         name: AppConfig.APP_NAME,
  //       );
  //     }
  //   }
  // }

  bool isWeb() {
    return kIsWeb;
  }

  void hideKeyboard() async {
    try {
      await SystemChannels.textInput.invokeMethod("TextInput.hide");
    } catch (e) {
      // logWhenDebug("HIDE KEYBOARD", e.toString());
    }
  }

  String formatWebUrl(String link) {
    if (link.contains("?")) {
      return link + "&";
    } else {
      return link + "?";
    }
  }

  // void clearLoadingContainer() {
  //   if (GetPlatform.isWeb) {
  //     final loader = document.getElementsByClassName('loading');
  //     if (loader.isNotEmpty) {
  //       loader.first.remove();
  //     }
  //   }
  // }
}
