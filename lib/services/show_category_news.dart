import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_flutter/models/show_category.dart';

class ShowCategoryNews {
  List<ShowCategoryModel> categories = [];

  Map<String, String> category = {
    'Business':
        'https://newsapi.org/v2/top-headlines?country=ca&category=business&apiKey=b510573710c3424882aa80fb2faa6752',
    'Entertainment':
        'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=b510573710c3424882aa80fb2faa6752',
    'General':
        'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=b510573710c3424882aa80fb2faa6752',
    'Health':
        'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=b510573710c3424882aa80fb2faa6752',
    'Sports':
        'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=b510573710c3424882aa80fb2faa6752',
    // 'Technology':
    //     'https://newsapi.org/v2/top-headlines?country=ca&category=business&apiKey=b510573710c3424882aa80fb2faa6752',
    // 'Science':
    //     'https://newsapi.org/v2/top-headlines?country=ca&category=business&apiKey=b510573710c3424882aa80fb2faa6752',
  };

  Future<void> getCategoriesNews(String category) async {
    // String apiKey =
    //     "https://newsapi.org/v2/top-headlines?country=ca&[\$category.LowerCase()] ?? apiKey=b510573710c3424882aa80fb2faa6752";

    String url =
        "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=b510573710c3424882aa80fb2faa6752";

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ShowCategoryModel categoryModel = ShowCategoryModel(
            title: element["title"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"],
            author: element["author"],
          );
          categories.add(categoryModel);
        }
      });
    }
  }
}
