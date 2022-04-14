import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/product_model.dart';

class ApiService {
  static var client = http.Client();

  static Future<List<ProductModel>?> fetchProducts() async {
    var url = Uri.parse('change to url here');
    var response = await client.get(url);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productModelFromJson(jsonString);
    }
    return null;
  }
}

class ApiConnectService extends GetConnect {
  // Get request
  Future<List<ProductModel>?> fetchProducts() async {
    final response = await get('');
    if (response.status.hasError) {
      return Future.error(response.statusText ?? '');
    } else {
      return response.body['results'];
    }
  }

  // Post request
  Future<Response> postProducts(String body) async {
    // * post, get, put, delete || use post method all the data to web server and handle from there
    const url = 'http://someurl';
    final headers = {"Accept": "application/json"};
    final response = await post(
      url,
      body,
      contentType: 'application/x-www-form-urlencoded',
      headers: headers,
    );
    if (response.status.hasError) {
      return Future.error(response.statusText ?? '');
    } else {
      return response.body['results'];
    }
  }

  // Post request with File
  Future<Response<ProductModel>> postCases(List<int> image) {
    final form = FormData({
      'file': MultipartFile(image, filename: 'avatar.png'),
      'otherFile': MultipartFile(image, filename: 'cover.png'),
    });
    return post('http://youapi/users/upload', form);
  }

  GetSocket userMessages() {
    return socket('https://yourapi/users/socket');
  }
}
