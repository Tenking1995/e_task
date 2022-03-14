import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';
import '../models/http_exception.dart';
import 'task.dart';

class Tasks with ChangeNotifier {
  List<Task> _items = [];

  // var _showFavoritesOnly = false;
  final String? authToken;
  final String? userId;

  Tasks(this.authToken, this.userId, this._items);

  List<Task> get taskList {
    return [..._items];
  }

  List<Task> get completedTasks {
    return _items.where((taskItem) => (taskItem.progress ?? 0) > 0).toList();
  }

  Task findById(String taskId) {
    return _items.firstWhere((task) => task.id == taskId);
  }

  Future<void> fetchAndSetTasks([bool isCompleted = false]) async {
    var url = Uri.parse('${Constants.baseUrl}tasks.json?auth=$authToken&orderBy="receiverId"&equalTo="$userId"');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>?;
      debugPrint(response.body);
      if (extractedData == null) {
        return;
      }
      final List<Task> loadedTasks = [];
      extractedData.forEach((taskId, taskData) {
        if (isCompleted) {
          if (taskData['progress'] == 100) {
            loadedTasks.add(Task(
              id: taskId,
              title: taskData['title'],
              description: taskData['description'],
              lastUpdatedDate: DateTime.tryParse(taskData['lastUpdatedDate']),
              createdDate: DateTime.tryParse(taskData['createdDate']),
              startDate: DateTime.tryParse(taskData['startDate']),
              endDate: DateTime.tryParse(taskData['endDate']),
              receiverId: taskData['receiverId'],
              creatorId: taskData['creatorId'],
              progress: taskData['progress'],
            ));
          }
        }
        else {
          loadedTasks.add(Task(
              id: taskId,
              title: taskData['title'],
              description: taskData['description'],
              lastUpdatedDate: DateTime.tryParse(taskData['lastUpdatedDate']),
              createdDate: DateTime.tryParse(taskData['createdDate']),
              startDate: DateTime.tryParse(taskData['startDate']),
              endDate: DateTime.tryParse(taskData['endDate']),
              receiverId: taskData['receiverId'],
              creatorId: taskData['creatorId'],
              progress: taskData['progress'],
            ));
        }
      });
      _items = loadedTasks;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addTask(Task task) async {
    final url = Uri.parse('${Constants.baseUrl}tasks.json?auth=$authToken');
    final timestamp = DateTime.now();
    try {
      var response = await http.post(
        url,
        body: json.encode({
          'title': task.title,
          'description': task.description,
          'lastUpdatedDate': timestamp.toIso8601String(),
          'createdDate': timestamp.toIso8601String(),
          'startDate': task.startDate?.toIso8601String(),
          'endDate': task.endDate?.toIso8601String(),
          'receiverId': task.receiverId,
          'creatorId': userId,
          'progress': 0,
        }),
      );
      final newTask = Task(
        id: json.decode(response.body)['name'],
        title: task.title,
        description: task.description,
        lastUpdatedDate: timestamp,
        createdDate: timestamp,
        startDate: task.startDate,
        endDate: task.endDate,
        receiverId: task.receiverId,
        creatorId: userId,
        progress: 0,
      );
      _items.add(newTask);
      // _items.insert(0, newProduct); // add to the 1st index of the list
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> updateTask(String id, Task newTask) async {
    final taskIndex = _items.indexWhere((prod) => prod.id == id);
    if (taskIndex >= 0) {
      final url = Uri.parse('${Constants.baseUrl}tasks/$id.json?auth=$authToken');
      await http.patch(url,
          body: json.encode({
            'title': newTask.title,
            'description': newTask.description,
            'lastUpdatedDate': DateTime.now().toIso8601String(),
            'startDate': newTask.startDate?.toIso8601String(),
            'endDate': newTask.endDate?.toIso8601String(),
            'receiverId': newTask.receiverId,
            'progress': newTask.progress,
          }));
      _items[taskIndex] = newTask;
      notifyListeners();
    }
  }

  Future<void> deleteTask(String id) async {
    final url = Uri.parse('${Constants.baseUrl}tasks/$id.json?auth=$authToken');
    final existingTaskIndex = _items.indexWhere((task) => task.id == id);
    Task? existingTask = _items[existingTaskIndex];
    _items.removeAt(existingTaskIndex);
    notifyListeners();
    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      _items.insert(existingTaskIndex, existingTask);
      notifyListeners();
      throw HttpException('Could not delete task.');
    }
    existingTask = null;
  }
}
