import 'dart:convert';
import 'package:flutter/material.dart';
import '../bindings/model_binding.dart';
import '../bindings/package_binding.dart';
import '../bindings/api_binding.dart';

enum HospitalViewState { none, loading, error }

class HospitalViewModel extends ChangeNotifier {
  HospitalViewState _state = HospitalViewState.none;
  HospitalViewState get state => _state;

  changeState(HospitalViewState state) {
    _state = state;
    notifyListeners();
  }

  int? userId;
  String? token;

  void updateData(uid, tokenData) {
    token = tokenData;
    userId = uid;
    notifyListeners();
  }

  List<Session> _dataSession = [];
  List<Session> get dataSession => _dataSession;

  List<Session> _dataHome = [];
  List<Session> get dataHome => _dataHome;

  late Session dataSelect;

  Future homeData(String city) async {
    _dataHome.clear();
    changeState(HospitalViewState.loading);

    try {
      final dateNow = DateTime.now();
      final stringDate = DateFormat("yyyy-MM-dd").format(dateNow).toString();
      // print(DateFormat("yyyy-MM-dd").format(dateNow));
      Response data = await HospitalAPI.getDataByCity(city, stringDate);
      if (data.statusCode == 200) {
        final sessions = data.data as Map<String, dynamic>;
        if (sessions["data"].isNotEmpty) {
          for (var session in sessions["data"]) {
            Session data = Session(
                id: session["idSession"],
                name: session["vaksin"]["user"]["nama"].toString(),
                address: session["vaksin"]["user"]["address"].toString(),
                start: session["start"].toString(),
                end: session["end"].toString(),
                vaccine: session["vaksin"]["nama"].toString(),
                stock: session["vaksin"]["quantity"],
                date: DateTime.parse(session["date"].toString()));

            _dataHome.add(data);
            notifyListeners();
          }
        }
      }
      changeState(HospitalViewState.none);
    } catch (e) {
      changeState(HospitalViewState.error);
    }
  }

  Future getDataByCity(String city, date) async {
    _dataSession.clear();
    Response data = await HospitalAPI.getDataByCity(city, date);
    if (data.statusCode == 200) {
      final sessions = data.data as Map<String, dynamic>;
      if (sessions["data"].isNotEmpty) {
        for (var session in sessions["data"]) {
          Session data = Session(
              id: session["idSession"],
              name: session["vaksin"]["user"]["nama"].toString(),
              address: session["vaksin"]["user"]["address"].toString(),
              start: session["start"].toString(),
              end: session["end"].toString(),
              vaccine: session["vaksin"]["nama"].toString(),
              stock: session["stok"],
              date: DateTime.parse(session["date"].toString()));

          _dataSession.add(data);
          notifyListeners();
        }

        return true;
      } else {
        return "data tidak ditemukan";
      }
    }
  }
}
