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
            url: currentPost['URL'],
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

void main() {
  final slips = {
    'slip_23': {
      'transactions': [123, 456],
      'shop': 1
    },
    'slip_42': {
      'transactions': [789],
      'shop': 2,
    },
  };

  final transactions = [
    {
      'id': 123,
      'amount': 10.01,
      'payout': false,
    },
    {
      'id': 456,
      'amount': 5.01,
      'payout': true,
    },
    {
      'id': 789,
      'amount': 20.1,
      'payout': false,
    },
  ];

  final shops = [
    [1, 'Zalando.de'],
    [2, 'Amazon.com'],
  ];

  var mResult = new Map();
  slips.forEach((k, v) {
    String mKey = "${k}".substring(5);
    var innerMap = new Map();

    var mTransactionValues = v["transactions"] as List<int>;
    innerMap['number_transactions'] = mTransactionValues.length;

    var mShopValue = v["shop"] as int;
    for (int i = 0; i < shops.length; i++) {
      var id = shops[i];
      if (id[0] == mShopValue) {
        innerMap['shop'] = id[1];
      }
    }

    var mTotalAmount = 0.0;
    for (int i = 0; i < mTransactionValues.length; i++) {
      var id = mTransactionValues[i];

      for (int i = 0; i < transactions.length; i++) {
        var transactionsId = transactions[i]['id'];
        var transactionsAmount = transactions[i]['amount'] as double;
        if (id == transactionsId) {
          if ((transactions[i]['payout'] as bool) == false) {
            mTotalAmount += transactionsAmount;
          } else {
            mTotalAmount -= transactionsAmount;
          }
        }
      }

      innerMap['total_amount'] = mTotalAmount;
    }

    mResult[mKey] = innerMap;
  });
  print(mResult);

//   String ello = hello.substring(1);

  // Your task: Use the three data sources above and create the following result.
  // Bonus: Try to write as few lines as possible for your solution

  final result = {
    '23': {
      'number_transactions': 2, // no of transactions per slip
      'shop': 'Zalando.de', // shop title
      'total_amount': 5, // total amount of transactions (a payout must be subtracted instead of added!)
    },
    '42': {
      'number_transactions': 1,
      'shop': 'Amazon.com',
      'total_amount': 20.1,
    },
  };

  print(result);
}
