import 'dart:convert';
import 'package:flutter/material.dart';
import '../bindings/model_binding.dart';
import '../bindings/api_binding.dart';
import '../bindings/package_binding.dart';

enum NewsViewState { none, loading, error }

class NewsViewModel extends ChangeNotifier {
  NewsViewState _state = NewsViewState.none;
  NewsViewState get state => _state;

  changeState(NewsViewState state) {
    _state = state;
    notifyListeners();
  }

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
      Response newsResponse = await NewsAPI.getAllData();
      if (newsResponse.statusCode == 200) {
        var news = newsResponse.data as Map<String, dynamic>;
        for (var element in news["articles"]) {
          News data = News(
              author: "",
              publishedAt: "",
              title: element["title"].toString(),
              description: element["description"].toString(),
              image: element["urlToImage"].toString(),
              content: element["content"].toString());

          _newsData.add(data);
          notifyListeners();
        }
        changeState(NewsViewState.none);
      }
    } catch (e) {
      changeState(NewsViewState.error);
    }
  }
}
