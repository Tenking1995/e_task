import 'package:get/get_connect/connect.dart';

import '../../models/product_model.dart';

class ApiProvider extends GetConnect {
  String appBaseUrl = 'https://www.xxx.com/task';

  ApiProvider() {
    httpClient.baseUrl = appBaseUrl;
    httpClient.defaultContentType = 'application/json';
  }

  Future<List<ProductModel>> getProductList(String page) async {
    try {
      final response = await get('?page=$page');
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        return productModelFromJson(response.bodyString!);
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
