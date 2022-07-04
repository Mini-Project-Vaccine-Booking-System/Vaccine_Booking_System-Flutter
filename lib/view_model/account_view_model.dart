import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:vaccine/models/api/family_api.dart';
import 'package:vaccine/models/api/user_api.dart';
import 'package:vaccine/models/user.dart';

import '../models/account.dart';
import '../models/api/account_api.dart';

class AccoutnViewModel extends ChangeNotifier {
  int? userId;
  // String? token;

  void updateData(
    uid,
    /* tokenData */
  ) {
    // token = tokenData;
    userId = uid;
    notifyListeners();
  }

  User? _data;
  User? get data => _data;

  Future<void> inisialData() async {
    Response response = await UserAPI.getDataUserById(userId.toString());
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      User dataUser = User(
          id: data["idUser"],
          email: data["email"],
          password: data["password"],
          nik: data["nik"],
          phone: data["noHp"],
          nama: data["nama"],
          gender: data["gender"],
          tanggalLahir: DateTime.parse(data["tglLahir"]),
          image: data["image"]);

      _data = dataUser;
      notifyListeners();
    }
    // Response response = await AccountAPI.getDataFamilyParent(userId, token);
    // if (response.statusCode == 200) {
    //   final data = jsonDecode(response.body) as Map<String, dynamic>;
    //   final dataUser = data["data"][0] as Map<String, dynamic>;
    //   Account dataAccount = Account(
    //       id: dataUser["id"],
    //       idUser: dataUser["attributes"]["user_id"],
    //       name: dataUser["attributes"]["fullname"].toString(),
    //       email: dataUser["attributes"]["email"].toString(),
    //       password: dataUser["attributes"]["password"].toString(),
    //       nik: dataUser["attributes"]["nik"].toString(),
    //       usia: dataUser["attributes"]["usia"].toString(),
    //       telp: dataUser["attributes"]["phone"].toString(),
    //       gender: dataUser["attributes"]["gender"].toString(),
    //       photo: dataUser["attributes"]["photo"].toString(),
    //       isParent: dataUser["attributes"]["isParent"],
    //       createdAt: DateTime.now());

    //   _data = dataAccount;

    //   notifyListeners();
    // }
  }

  Future updateUser(String hint, String newData) async {
    Map dataUser = _data!.toJson();
    for (String key in dataUser.keys) {
      if (key == hint) {
        dataUser[key] = newData;
      }
    }
    print(dataUser);
    User dataNew = User(
        id: data!.id,
        email: dataUser["email"],
        password: dataUser["password"],
        nik: dataUser["nik"],
        phone: dataUser["noHp"],
        nama: dataUser["nama"],
        gender: dataUser["gender"],
        tanggalLahir: DateTime.parse(dataUser["tglLahir"]),
        image: dataUser["image"]);
    _data = dataNew;
    final dataResponse = await UserAPI.updateData(_data!.toJson(), userId);
    if (dataResponse == true) {
      notifyListeners();
      return true;
    }

    // if (hint != "password" || hint != "email") {
    //   await FamilyAPI.updateDataById(userFamily, jsonEncode(dataUpdate));
    // }

    // if (dataResponse != null) {
    //   var dataMap = _data!.toMap();
    //   dataMap[hint] = value;
    //   dataMap.forEach(
    //     (key, value) {
    //       Account acc = Account(
    //           photo: dataMap["photo"],
    //           idUser: userId!,
    //           name: dataMap["name"],
    //           email: dataMap["email"],
    //           password: dataMap["password"],
    //           createdAt: DateTime.parse(dataMap["createdAt"]),
    //           nik: dataMap["nik"],
    //           usia: dataMap["usia"],
    //           telp: dataMap["telp"],
    //           gender: dataMap["gender"]);
    //       _data = acc;
    //     },
    //   );
    //   notifyListeners();
    // }
  }
}
