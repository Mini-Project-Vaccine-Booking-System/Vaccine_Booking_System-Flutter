import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:vaccine/models/api/family_api.dart';
import 'package:vaccine/models/family.dart';

enum FamilyViewState { none, loading, error }

class FamilyViewModel extends ChangeNotifier {
  FamilyViewState _state = FamilyViewState.none;
  FamilyViewState get state => _state;

  changeState(FamilyViewState state) {
    _state = state;
    notifyListeners();
  }

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
    changeState(FamilyViewState.loading);

    try {
      _data.clear();
      Response response = await FamilyAPI.getAllData(userId);
      if (response.statusCode == 200) {
        final dataResponse = jsonDecode(response.body) as Map<String, dynamic>;
        for (var element in dataResponse["data"]) {
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
        changeState(FamilyViewState.none);
      }
    } catch (e) {
      changeState(FamilyViewState.error);
    }
  }

  Future addMember(username, nik, date, phone, gender) async {
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
      await inisialData();
      return true;
    }
  }

  Future<void> getAllData() async {
    _allData.clear();
    Response response = await FamilyAPI.getAllData(userId);
    if (response.statusCode == 200) {
      final dataResponse = jsonDecode(response.body) as Map<String, dynamic>;
      for (var element in dataResponse["data"]) {
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

  Future updateFam(Family family) async {
    _data.firstWhere((element) {
      if (element.id == family.id) {
        element.name = family.name;
        element.nik = family.nik;
        element.tanggalLahir = family.tanggalLahir;
        element.telp = family.telp;
        element.gender = family.gender;
      }

      return true;
    });

    final dataResponse = await FamilyAPI.updateData(family.toJson(), family.id);
    if (dataResponse == true) {
      notifyListeners();
      return true;
    }
  }

  Future deleteData() async {
    _data.removeWhere((element) => element.id == dataSelect.id);
    final dataResponse = await FamilyAPI.deleteData(dataSelect.id);
    if (dataResponse == true) {
      notifyListeners();
      return true;
    }
  }
}
