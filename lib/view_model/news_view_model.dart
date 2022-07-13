import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:vaccine/models/api/news_api.dart';
import 'package:vaccine/models/news.dart';

enum NewsViewState { none, loading, error }

class NewsViewModel extends ChangeNotifier {
  NewsViewState _state = NewsViewState.none;
  NewsViewState get state => _state;

  changeState(NewsViewState state) {
    _state = state;
    notifyListeners();
  }

  // List<News> _newsDataHome = [];
  // List<News> get newsDataHome => _newsDataHome;

  List<News> _newsData = [];
  List<News> get newsData => _newsData;

  News? _newsSelect;

  Future<void> setDataSelect(News data) async {
    _newsSelect = data;
    notifyListeners();
  }

  News get getDataSelect => _newsSelect!;

  Future initialData() async {
    changeState(NewsViewState.loading);

    try {
      _newsData.clear();
      Response newsResponse = await NewsAPI.getDataHome();
      if (newsResponse.statusCode == 200) {
        var news = jsonDecode(newsResponse.body) as Map<String, dynamic>;
        // print(news);
        for (var element in news["articles"]) {
          News data = News(
              author: "",
              publishedAt: "",
              title: element["title"],
              description: element["description"],
              image: element["urlToImage"],
              content: element["content"]);

          _newsData.add(data);
          notifyListeners();
        }
        changeState(NewsViewState.none);
      }
    } catch (e) {
      changeState(NewsViewState.error);
    }
  }

  // Future getDataNews() async {
  //   _newsData.clear();
  //   Response newsResponse = await NewsAPI.getData();
  //   if (newsResponse.statusCode == 200) {
  //     var news = jsonDecode(newsResponse.body) as Map<String, dynamic>;
  //     // print(news);
  //     for (var element in news["articles"]) {
  //       News data = News(
  //           author: "",
  //           publishedAt: "",
  //           title: element["title"],
  //           description: element["description"],
  //           image: element["urlToImage"],
  //           content: element["content"]);

  //       _newsData.add(data);
  //       notifyListeners();
  //     }
  //   }
  // }
}
