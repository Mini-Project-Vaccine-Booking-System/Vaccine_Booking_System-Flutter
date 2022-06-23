import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:vaccine/models/api/hospital_api.dart';
import 'package:vaccine/models/hospital.dart';

class HospitalViewModel extends ChangeNotifier {
  int? userId;
  String? token;

  void updateData(uid, tokenData) {
    token = tokenData;
    userId = uid;
    notifyListeners();
  }

  List<Hospital> _data = [];
  List<Hospital> get data => _data;

  Future getDataByCity(String city) async {
    _data.clear();
    Response data = await HospitalAPI.getDataByCity(city, token);
    if (data.statusCode == 200) {
      final dataHospital = jsonDecode(data.body) as Map<String, dynamic>;
      if (dataHospital["data"].length > 0) {
        for (var value in dataHospital["data"]) {
          Response schedules =
              await HospitalAPI.checkSchedule(value["id"], token);
          final dataSchedules =
              jsonDecode(schedules.body) as Map<String, dynamic>;
          Hospital data = Hospital(
              name: value["attributes"]["name"].toString(),
              address: value["attributes"]["address"].toString(),
              city: value["attributes"]["city"].toString(),
              availability: dataSchedules["data"].length > 0 ? true : false);

          _data.add(data);
          notifyListeners();
        }

        return true;
      } else {
        return "data tidak ditemukan";
      }
    }
  }
}
