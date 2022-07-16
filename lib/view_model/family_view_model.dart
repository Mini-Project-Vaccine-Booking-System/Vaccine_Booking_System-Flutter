import 'dart:convert';
import 'package:flutter/material.dart';
import '../bindings/model_binding.dart';
import '../bindings/package_binding.dart';
import '../bindings/api_binding.dart';

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

  void updateData(uid, tokenData) {
    token = tokenData;
    userId = uid;
    notifyListeners();
  }

  List<Family> _data = [];
  List<Family> get data => _data;

  List<Family> _allData = [];
  List<Family> get allData => _allData;

  Family? dataSelect;

  Future inisialData() async {
    changeState(FamilyViewState.loading);

    try {
      _data.clear();
      Response response = await FamilyAPI.getAllData(userId);
      if (response.statusCode == 200) {
        final dataResponse = response.data as Map<String, dynamic>;
        for (var element in dataResponse["data"]) {
          if (element["hubungan"] != "userParent") {
            Family dataFamily = Family(
                id: element["idKelompok"],
                idParent: userId!,
                name: element["namaKelompok"].toString(),
                nik: element["nik"].toString(),
                tanggalLahir: element["tglLahir"].toString(),
                telp: element["tlp"].toString(),
                gender: element["gender"].toString(),
                hubungan: element["hubungan"].toString());

            _data.add(dataFamily);
          }
        }

        notifyListeners();
        changeState(FamilyViewState.none);
        return true;
      }
    } catch (e) {
      changeState(FamilyViewState.error);
    }
  }

  Future addMember(String username, String nik, DateTime date, String phone,
      String gender) async {
    Family dataFamily = Family(
        id: 0,
        idParent: userId!,
        name: username,
        nik: nik,
        tanggalLahir: date.toIso8601String(),
        telp: phone,
        gender: gender,
        hubungan: "");

    Response response = await FamilyAPI.addData(dataFamily.toJson(), token);
    if (response.statusCode == 200) {
      bool response = await inisialData();
      if (response == true) {
        return true;
      }
    }
  }

  Future<void> getAllData() async {
    _allData.clear();
    Response response = await FamilyAPI.getAllData(userId);
    if (response.statusCode == 200) {
      final dataResponse = response.data as Map<String, dynamic>;
      for (var element in dataResponse["data"]) {
        Family dataFamily = Family(
            id: element["idKelompok"],
            idParent: userId!,
            name: element["namaKelompok"].toString(),
            nik: element["nik"].toString(),
            tanggalLahir: element["tglLahir"].toString(),
            telp: element["tlp"].toString(),
            gender: element["gender"].toString(),
            hubungan: element["hubungan"].toString());

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

    Response dataResponse =
        await FamilyAPI.updateData(family.toJson(), family.id, token);
    print(dataResponse.statusCode);
    print(dataResponse.data);
    if (dataResponse.statusCode == 200) {
      notifyListeners();
      return true;
    }
  }

  Future deleteData() async {
    _data.removeWhere((element) => element.id == dataSelect!.id);
    Response dataResponse = await FamilyAPI.deleteData(dataSelect!.id, token);
    print(dataResponse.data);
    if (dataResponse.statusCode == 200) {
      notifyListeners();
      return true;
    }
  }
}
