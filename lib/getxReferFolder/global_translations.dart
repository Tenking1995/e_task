import 'package:get/get.dart';

class GlobalTranslations extends Translations {

  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'hello': 'Hello',
    },
    'zh_CN': {
      'hello': '你好',
    }
  };
  
}