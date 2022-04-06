// import 'dart:convert';
// import 'dart:developer';

// import 'package:flutter/foundation.dart';
// import 'package:get/get.dart';

// class ApiService {
//   final _Api _api = _Api();

//   void post({
//     required String endpoint,
//     String body = "",
//     bool isEncrypted = false,
//     String? isEncryptedToken,
//     bool skipResultCheck = false,
//     String requestId = "",
//     Function(dynamic data)? onSuccess,
//     Function(String error)? onError,
//     Function()? onLoginExpired,
//   }) {
//     _api.post(
//       endpoint: endpoint,
//       body: body,
//       isEncrypted: isEncrypted,
//       isEncryptedToken: isEncryptedToken,
//       skipResultCheck: skipResultCheck,
//       requestId: requestId,
//       onSuccess: onSuccess,
//       onError: onError,
//       onLoginExpired: onLoginExpired,
//     );
//   }
// }

// class _Api {
//   Dio _dio() {
//     return Dio(
//       BaseOptions(
//         receiveDataWhenStatusError: true,
//         connectTimeout: 20000,
//         receiveTimeout: 20000,
//       ),
//     );
//   }

//   Future<Options> options({
//     bool isEncrypted = false,
//     String? isEncryptedToken,
//   }) async {
//     Map<String, String> headers = {
//       "Content-Type": 'application/json',
//     };
//     if (isEncryptedToken?.isNotEmpty ?? false) {
//       if (isEncrypted) {
//         String clientGuid = await CacheHelper.getClientGuidWithoutTime();

//         String encryptedHeader = await EncryptionHelper.encrypt(clientGuid);

//         _showLogWhenDebug("clientGuid", clientGuid);
//         headers.addAll({"X-Encrypted": encryptedHeader});
//       }
//       headers.addAll({"Authorization": "Bearer ${isEncryptedToken}"});
//     } else {
//       if (isEncrypted) {
//         String clientGuid = await CacheHelper.getClientGuidWithoutTime();

//         String encryptedHeader = await EncryptionHelper.encrypt(clientGuid);

//         _showLogWhenDebug("clientGuid", clientGuid);
//         headers.addAll({"X-Encrypted": encryptedHeader});
//       }

//       if (CacheHelper.isKeyAvailable(CacheHelper.USER_LOGIN_DATA)) {
//         String response = CacheHelper.getContentWithoutTime(CacheHelper.USER_LOGIN_DATA);
//         LoginResponse loginResponse = loginResponseFromJson(response);
//         if (loginResponse.result != null) {
//           headers.addAll({"Authorization": "Bearer ${loginResponse.authToken}"});
//         }
//       }
//     }
//     _showLogWhenDebug("headers", headers.toString());
//     return Options(
//       validateStatus: (_) => true,
//       headers: headers,
//     );
//   }

//   void post({
//     required String endpoint,
//     String body = "",
//     bool isEncrypted = false,
//     String? isEncryptedToken,
//     bool skipResultCheck = false,
//     String requestId = "",
//     Function(dynamic data)? onSuccess,
//     Function(String error)? onError,
//     Function()? onLoginExpired,
//   }) async {
//     _showLogWhenDebug("POST", "${AppConfig.BASE_URL()}${endpoint}");
//     if (isEncrypted) {
//       addDebugToList(DebugApiModel(plainText: body));
//       _showLogWhenDebug("PARAMS", body);
//       body = await EncryptionHelper.encryptAes(body);
//     }
//     _showLogWhenDebug("PARAMS", body);
//     var startTime = DateTime.now();
//     var response = await _dio()
//         .post(
//       "${AppConfig.BASE_URL()}${endpoint}",
//       data: body,
//       options: await options(
//         isEncrypted: isEncrypted,
//         isEncryptedToken: isEncryptedToken,
//       ),
//     )
//         .catchError((error) {
//       if (error is DioError) {
//         var dioError = error as DioError;
//         if (dioError.error == "XMLHttpRequest error.") {
//           String requestIdValue = requestId.isNotEmpty ? "${requestId}: " : "";
//           if (onError != null) {
//             onError("${requestIdValue}${AppR().string.msg_unexpected_error}");
//           }
//         } else {
//           if (onError != null) onError("${dioError.error}");
//         }
//       } else {
//         _showLogWhenDebug("ERROR", AppR().string.msg_unexpected_error);
//         if (onError != null) onError(AppR().string.msg_unexpected_error);
//       }
//     });
//     var endTime = DateTime.now();
//     if (response.data == null) {
//       return;
//     }

//     addDebugToList(DebugApiModel(response: response, start: startTime, end: endTime));

//     if (response.statusCode == 200) {
//       bool result = response.data["result"];
//       _showLogWhenDebug("RESULT", "${result}");
//       if (!skipResultCheck) {
//         if (!result) {
//           _showLogWhenDebug("ERROR", response.data["errorMessage"] ?? "");
//           if (onError != null) onError(response.data["errorMessage"] ?? AppR().string.msg_unexpected_error);
//         }
//       }
//       _showLogWhenDebug("SUCCESS", response.data.toString());
//       if (onSuccess != null) onSuccess(response.data);
//     } else if (response.statusCode == 401 ||
//         response.statusCode == 516 ||
//         response.statusCode == 514 ||
//         response.statusCode == 511) {
//       _showLogWhenDebug("ERROR", "LOGIN EXPIRED");
//       if (onLoginExpired != null) {
//         onLoginExpired();
//       }
//       if (onError != null) {
//         String requestIdValue = requestId.isNotEmpty ? "|${requestId}" : "";
//         if (response.statusCode == 401) {
//           onError("${response.statusCode}${requestIdValue}: Unauthorized access");
//         } else {
//           onError("${response.statusCode}${requestIdValue}: ${AppR().string.msg_unexpected_error}");
//         }
//       }
//     } else {
//       try {
//         Map<String, dynamic> jsonObject = json.decode(response.data);
//         _showLogWhenDebug(
//           "ERROR",
//           jsonObject.toString().isNotEmpty ? jsonObject.toString() : AppR().string.msg_unexpected_error,
//         );
//         if (onError != null) {
//           onError(
//             jsonObject.toString().isNotEmpty ? jsonObject.toString() : AppR().string.msg_unexpected_error,
//           );
//         }
//       } catch (e) {
//         _showLogWhenDebug("ERROR", "${e}");
//       }
//     }
//   }

//   _showLogWhenDebug(String status, String e) {
//     if (kDebugMode) {
//       if (Utilities().isWeb()) {
//         print("$status => ${e.toString()}");
//       } else {
//         log("$status => ${e.toString()}", name: AppConfig.APP_NAME);
//       }
//     }
//   }

//   bool addDebugToList(DebugApiModel debugApiModel) {
//     try {
//       _showLogWhenDebug("Add debug failed", "${Get.isRegistered<DebugController>()}");
//       if (Get.isRegistered<DebugController>()) {
//         DebugController debugController = Get.find<DebugController>();
//         debugController.addDebug(debugApiModel);
//         debugController.update();
//       }
//     } catch (e) {
//       _showLogWhenDebug("Add debug failed", "${e}");
//     }
//     return false;
//   }
// }
