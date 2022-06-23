import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:vaccine/models/api/family_api.dart';

import '../models/account.dart';
import '../models/api/account_api.dart';

class AccoutnViewModel extends ChangeNotifier {
  int? userId;
  String? token;

  void updateData(uid, tokenData) {
    token = tokenData;
    userId = uid;
    notifyListeners();
  }

  Account? _data;
  Account? get data => _data;

  Future<void> inisialData() async {
    Response response = await AccountAPI.getDataFamilyParent(userId, token);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final dataUser = data["data"][0] as Map<String, dynamic>;
      Account dataAccount = Account(
          id: dataUser["id"],
          idUser: dataUser["attributes"]["user_id"],
          name: dataUser["attributes"]["fullname"].toString(),
          email: dataUser["attributes"]["email"].toString(),
          password: dataUser["attributes"]["password"].toString(),
          nik: dataUser["attributes"]["nik"].toString(),
          usia: dataUser["attributes"]["usia"].toString(),
          telp: dataUser["attributes"]["phone"].toString(),
          gender: dataUser["attributes"]["gender"].toString(),
          photo: dataUser["attributes"]["photo"].toString(),
          isParent: dataUser["attributes"]["isParent"],
          createdAt: DateTime.now());

      _data = dataAccount;

      notifyListeners();
    }
  }

  // Future updateAccount(String hint, String value) async {
  //   var dataUpdate = {hint: value};
  //   final dataResponse =
  //       await AccountAPI.updateDataById(userId, jsonEncode(dataUpdate));

  //   if (hint != "password" || hint != "email") {
  //     await FamilyAPI.updateDataById(userFamily, jsonEncode(dataUpdate));
  //   }

  //   if (dataResponse != null) {
  //     var dataMap = _data!.toMap();
  //     dataMap[hint] = value;
  //     dataMap.forEach(
  //       (key, value) {
  //         Account acc = Account(
  //             photo: dataMap["photo"],
  //             idUser: userId!,
  //             name: dataMap["name"],
  //             email: dataMap["email"],
  //             password: dataMap["password"],
  //             createdAt: DateTime.parse(dataMap["createdAt"]),
  //             nik: dataMap["nik"],
  //             usia: dataMap["usia"],
  //             telp: dataMap["telp"],
  //             gender: dataMap["gender"]);
  //         _data = acc;
  //       },
  //     );
  //     notifyListeners();
  //   }
  // }
}
