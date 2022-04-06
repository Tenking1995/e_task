import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppTranslations extends Translations {
  static const String LANGUAGE_CODE = "language_code";
  static const locale = Locale("en");
  static const fallbackLocale = Locale("en");
  static Map<String, String> en = {
    'txt_greeting': 'Hello',
  };

  static Map<String, String> ms = {
    'txt_greeting': 'Apa Khabar',
  };

  static Map<String, String> zh = {
    'txt_greeting': "你好",
  };

  static void init() {
    final box = GetStorage();
    String? languageCode = box.read(LANGUAGE_CODE);
    if (languageCode == null) {
      Get.updateLocale(locale);
      box.write(LANGUAGE_CODE, "en");
    } else {
      Get.updateLocale(Locale(languageCode));
    }
  }

  static void updateLocale({String languageCode = "en"}) {
    final box = GetStorage();
    Get.updateLocale(Locale(languageCode));
    box.write(LANGUAGE_CODE, languageCode);
  }

  @override
  Map<String, Map<String, String>> get keys => {"en": en, "ms": ms, "zh": zh};
}
