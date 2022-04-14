import 'package:flutter/material.dart';

class Task with ChangeNotifier {
  final String? id;
  final String? title;
  final String? description;
  final DateTime? lastUpdatedDate;
  final DateTime? createdDate;
  DateTime? startDate;
  DateTime? endDate;
  final String? receiverId;
  final String? creatorId;
  int? progress;

  Task({
    this.id,
    this.title,
    this.description,
    this.lastUpdatedDate,
    this.createdDate,
    this.startDate,
    this.endDate,
    this.receiverId,
    this.creatorId,
    this.progress,
  });

  // void _setFavValue(bool newValue) {
  //   isFavorite = newValue;
  //   notifyListeners();
  // }

  // Future<void> toggleFavoriteStatus(String authToken, String userId) async {
  //   debugPrint('AauthToken: ${authToken}');
  //   debugPrint('userId: ${userId}');
  //   final oldStatus = isFavorite;
  //   isFavorite = !isFavorite;
  //   notifyListeners();
  //   final url = Uri.parse(
  //       'https://myshop-d7993-default-rtdb.asia-southeast1.firebasedatabase.app/userFavorites/$userId/$id.json?auth=$authToken');
  //   try {
  //     final response = await http.put(
  //       url,
  //       body: json.encode(
  //         isFavorite,
  //       ),
  //     );

  //     // final response = await http.patch(
  //     //   url,
  //     //   body: json.encode({
  //     //     'isFavorite': isFavorite,
  //     //   }),
  //     // );
  //     debugPrint(response.body);
  //     if (response.statusCode >= 400) {
  //       _setFavValue(oldStatus);
  //     }
  //   } catch (e) {
  //     debugPrint(e);
  //     _setFavValue(oldStatus);
  //   }
  // }
}
