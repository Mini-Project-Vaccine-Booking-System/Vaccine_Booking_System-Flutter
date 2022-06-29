import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:vaccine/models/api/news_api.dart';
import 'package:vaccine/models/news.dart';

class NewsViewModel extends ChangeNotifier {
  List<News> _newsData = [];
  List<News> get newsData => _newsData;

  News? _newsSelect;

  Future<void> setDataSelect(News data) async {
    _newsSelect = data;
    notifyListeners();
  }

  News get getDataSelect => _newsSelect!;

  Future getDataNews() async {
    _newsData.clear();
    Response newsResponse = await NewsAPI.getData();
    if (newsResponse.statusCode == 200) {
      var news = jsonDecode(newsResponse.body) as Map<String, dynamic>;
      for (var element in news["articles"]) {
        News data = News(
            author: element["author"],
            publishedAt: element["publishedAt"],
            title: element["title"],
            description: element["description"],
            image: element["urlToImage"],
            content: element["content"]);

        _newsData.add(data);
        notifyListeners();
      }
    }
  }
}
