import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:vaccine/models/api/family_api.dart';
import 'package:vaccine/models/family.dart';

class FamilyViewModel extends ChangeNotifier {
  int? userId;
  String? token;

  void updateData(uid, tokenData) {
    token = tokenData;
    userId = uid;
    notifyListeners();
  }

  List<Family> _data = [];
  List<Family> get data => _data;

  Future<void> inisialData() async {
    Response data = await FamilyAPI.getData(userId, token);
    if (data.statusCode == 200) {
      final dataResponse = jsonDecode(data.body) as Map<String, dynamic>;
      _data.clear();
      final dataUsers = dataResponse["data"] as List;
      for (var value in dataUsers) {
        Family acc = Family(
          usia: value["attributes"]["usia"].toString(),
          telp: value["attributes"]["phone"].toString(),
          nik: value["attributes"]["nik"].toString(),
          name: value["attributes"]["fullname"].toString(),
          idUser: value["attributes"]["user_id"],
          id: value["id"],
          gender: value["attributes"]["gender"].toString(),
        );

        _data.add(acc);
      }

      notifyListeners();
    }
  }

  Future addMember(String name, nik, usia, telp, gender) async {
    var userData = Family(
        id: 0,
        idUser: userId!,
        name: name,
        nik: nik,
        usia: usia,
        telp: telp,
        gender: gender);

    Response data = await FamilyAPI.addData({"data": userData.toJson()}, token);
    if (data.statusCode != null) {
      final dataResponse = jsonDecode(data.body);
      print(dataResponse);
    }
  }

  // Future<void> allData() async {
  //   print(userFamily);
  //   final data = await FamilyAPI.getDataByUser(userId);
  //   if (data != null) {
  //     _data.clear();
  //     data.forEach(
  //       (key, value) {
  //         Family acc = Family(
  //             idFamily: key,
  //             idUser: value["idUser"],
  //             name: value["name"],
  //             createdAt: DateTime.parse(value["createdAt"]),
  //             nik: value["nik"],
  //             usia: value["usia"],
  //             telp: value["telp"],
  //             gender: value["gender"]);

  //         _data.add(acc);
  //       },
  //     );

  //     notifyListeners();
  //   }
  // }
}
