import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';
import 'blog_model.dart';

class Blogs with ChangeNotifier {
  List<BlogModel> _items = [];

  Blogs(this._items);

  List<BlogModel> get blogList {
    return [..._items];
  }

  BlogModel findById(int passedInBlogId) {
    return _items.firstWhere((blogId) => blogId.id == passedInBlogId);
  }

  Future<void> fetchAndSetBlogs(String? dateAfter) async {
    Uri url = dateAfter?.isEmpty == true || dateAfter == null
        ? Uri.parse('${Constants.baseUrl}posts?orderby')
        : Uri.parse('${Constants.baseUrl}posts?orderby=date&after=$dateAfter');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>?;
      debugPrint(response.body);
      if (extractedData == null) {
        return;
      }
      final List<BlogModel> loadedBlogs = [];

      var posts = await extractedData['posts'];
      for (int i = 0; i < posts.length; i++) {
        var currentPost = posts[i];
        loadedBlogs.add(
          BlogModel(
            id: currentPost['ID'],
            title: currentPost['title'],
            author: Author.fromJson(currentPost['author']),
            date: DateTime.parse(currentPost['date']),
          ),
        );
      }
      _items = loadedBlogs;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
