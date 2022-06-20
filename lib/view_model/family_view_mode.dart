import 'package:flutter/material.dart';
import 'package:vaccine/models/api/family_api.dart';
import 'package:vaccine/models/family.dart';

class FamilyViewModel extends ChangeNotifier {
  String? userId;
  String? userFamily;

  void updateData(uid, fid) {
    userId = uid;
    userFamily = fid;
    notifyListeners();
  }

  List<Family> _data = [];
  List<Family> get data => _data;

  Future<void> inisialData() async {
    print(userFamily);
    final data = await FamilyAPI.getDataByUser(userId);
    if (data != null) {
      _data.clear();
      data.forEach(
        (key, value) {
          if (key != userFamily) {
            Family acc = Family(
                idFamily: key,
                idUser: value["idUser"],
                name: value["name"],
                createdAt: DateTime.parse(value["createdAt"]),
                nik: value["nik"],
                usia: value["usia"],
                telp: value["telp"],
                gender: value["gender"]);

            _data.add(acc);
          }
        },
      );

      notifyListeners();
    }
  }

  Future addMember(String idFamily, name, nik, usia, telp, gender) async {
    var userData = Family(
        idFamily: idFamily,
        idUser: userId!,
        name: name,
        nik: nik,
        usia: usia,
        telp: telp,
        gender: gender,
        createdAt: DateTime.now());

    final data = await FamilyAPI.addData(userData.toJson());
    if (data != null) {
      _data.add(userData);
      print("tambah anggota sukses");
    }
  }

  Future<void> allData() async {
    print(userFamily);
    final data = await FamilyAPI.getDataByUser(userId);
    if (data != null) {
      _data.clear();
      data.forEach(
        (key, value) {
          Family acc = Family(
              idFamily: key,
              idUser: value["idUser"],
              name: value["name"],
              createdAt: DateTime.parse(value["createdAt"]),
              nik: value["nik"],
              usia: value["usia"],
              telp: value["telp"],
              gender: value["gender"]);

          _data.add(acc);
        },
      );

      notifyListeners();
    }
  }
}
