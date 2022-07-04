import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:vaccine/models/api/family_api.dart';
import 'package:vaccine/models/family.dart';

class FamilyViewModel extends ChangeNotifier {
  int? userId;
  String? token;

  void updateData(
    uid,
    /* tokenData */
  ) {
    // token = tokenData;
    userId = uid;
    notifyListeners();
  }

  List<Family> _data = [];
  List<Family> get data => _data;

  List<Family> _allData = [];
  List<Family> get allData => _allData;

  late Family dataSelect;

  Future<void> inisialData() async {
    _data.clear();
    Response response = await FamilyAPI.getAllData(userId);
    if (response.statusCode == 200) {
      final dataResponse = jsonDecode(response.body) as List;
      for (var element in dataResponse) {
        if (element["hubungan"] != "userParent") {
          Family dataFamily = Family(
              id: element["idKelompok"],
              idParent: userId!,
              name: element["namaKelompok"],
              nik: element["nik"],
              tanggalLahir: DateTime.parse(element["tglLahir"]),
              telp: element["tlp"],
              gender: element["gender"],
              hubungan: element["hubungan"]);

          _data.add(dataFamily);
        }
      }

      notifyListeners();
    }
  }

  Future addMember(String username, nik, date, phone, gender) async {
    Family dataFamily = Family(
        id: 0,
        idParent: userId!,
        name: username,
        nik: nik,
        tanggalLahir: date,
        telp: phone,
        gender: gender,
        hubungan: "");

    var response = await FamilyAPI.addData(dataFamily.toJson());
    if (response == true) {
      _data.add(dataFamily);
      return true;
    }
  }

  Future<void> getAllData() async {
    _allData.clear();
    Response response = await FamilyAPI.getAllData(userId);
    if (response.statusCode == 200) {
      final dataResponse = jsonDecode(response.body) as List;
      for (var element in dataResponse) {
        Family dataFamily = Family(
            id: element["idKelompok"],
            idParent: userId!,
            name: element["namaKelompok"],
            nik: element["nik"],
            tanggalLahir: DateTime.parse(element["tglLahir"]),
            telp: element["tlp"],
            gender: element["gender"],
            hubungan: element["hubungan"]);

        _allData.add(dataFamily);
      }

      notifyListeners();
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
