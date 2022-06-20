import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vaccine/models/api/family_api.dart';

import '../models/account.dart';
import '../models/api/account_api.dart';

class AccoutnViewModel extends ChangeNotifier {
  String? userId;
  String? userFamily;

  void updateData(uid, fid) {
    userId = uid;
    userFamily = fid;
    notifyListeners();
  }

  Account? _data;
  Account? get data => _data;

  Future<void> inisialData() async {
    final data = await AccountAPI.getDataById(userId);
    if (data != null) {
      data.forEach(
        (key, value) {
          Account acc = Account(
              photo: data["photo"],
              idUser: userId!,
              name: data["name"],
              email: data["email"],
              password: data["password"],
              createdAt: DateTime.parse(data["createdAt"]),
              nik: data["nik"],
              usia: data["usia"],
              telp: data["telp"],
              gender: data["gender"]);
          _data = acc;
        },
      );

      notifyListeners();
    }
  }

  Future updateAccount(String hint, String value) async {
    var dataUpdate = {hint: value};
    final dataResponse =
        await AccountAPI.updateDataById(userId, jsonEncode(dataUpdate));

    if (hint != "password" || hint != "email") {
      await FamilyAPI.updateDataById(userFamily, jsonEncode(dataUpdate));
    }

    if (dataResponse != null) {
      var dataMap = _data!.toMap();
      dataMap[hint] = value;
      dataMap.forEach(
        (key, value) {
          Account acc = Account(
              photo: dataMap["photo"],
              idUser: userId!,
              name: dataMap["name"],
              email: dataMap["email"],
              password: dataMap["password"],
              createdAt: DateTime.parse(dataMap["createdAt"]),
              nik: dataMap["nik"],
              usia: dataMap["usia"],
              telp: dataMap["telp"],
              gender: dataMap["gender"]);
          _data = acc;
        },
      );
      notifyListeners();
    }
  }
}
