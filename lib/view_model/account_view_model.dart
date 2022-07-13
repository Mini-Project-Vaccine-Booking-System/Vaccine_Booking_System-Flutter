import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:vaccine/models/api/family_api.dart';
import 'package:vaccine/models/api/user_api.dart';
import 'package:vaccine/models/user.dart';

import '../models/account.dart';
import '../models/api/account_api.dart';
import '../models/family.dart';

enum AccountViewState { none, loading, error }

class AccoutnViewModel extends ChangeNotifier {
  AccountViewState _state = AccountViewState.none;
  AccountViewState get state => _state;

  changeState(AccountViewState state) {
    _state = state;
    notifyListeners();
  }

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

  Family? _family;
  Family? get family => _family;

  Future<void> inisialData() async {
    changeState(AccountViewState.loading);

    try {
      Response response = await UserAPI.getDataUserById(userId.toString());
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        User dataUser = User(
            id: data["data"]["idUser"],
            email: data["data"]["email"],
            password: data["data"]["password"],
            nik: data["data"]["nik"],
            phone: data["data"]["noHp"],
            nama: data["data"]["nama"],
            gender: data["data"]["gender"],
            tanggalLahir: DateTime.parse(data["data"]["tglLahir"]),
            image: data["data"]["image"]);

        _data = dataUser;
        await getDataFam();
        notifyListeners();
        changeState(AccountViewState.none);
      }
    } catch (e) {
      changeState(AccountViewState.error);
    }
  }

  Future updateUser(String hint, newData) async {
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
        tanggalLahir: dataUser["tglLahir"],
        image: dataUser["image"]);
    _data = dataNew;
    final dataResponse = await UserAPI.updateData(_data!.toJson(), userId);
    await updateFam(hint, newData);
    if (dataResponse == true) {
      notifyListeners();
      return true;
    }
  }

  Future updatePhoto(String photo) async {
    _data!.image = photo;
    final dataResponse = await UserAPI.updateData(_data!.toJson(), userId);
    if (dataResponse == true) {
      notifyListeners();
      return true;
    }
  }

  Future getDataFam() async {
    late Family dataFam;
    Response response = await FamilyAPI.getAllData(userId);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      data["data"].forEach((element) {
        if (element["hubungan"] != "userParent") {
          return;
        }
        dataFam = Family(
            id: element["idKelompok"],
            idParent: userId!,
            name: element["namaKelompok"],
            nik: element["nik"],
            tanggalLahir: DateTime.parse(element["tglLahir"]),
            telp: element["tlp"],
            gender: element["gender"],
            hubungan: element["hubungan"]);
        _family = dataFam;
      });
    }
  }

  Future updateFam(hint, newData) async {
    Map dataFam = _family!.updateJson();
    for (String key in dataFam.keys) {
      if (key == hint) {
        dataFam[key] = newData;

        Family dataNew = Family(
            id: dataFam["id"],
            idParent: dataFam["id_user"],
            name: dataFam["nama"],
            nik: dataFam["nik"],
            tanggalLahir: dataFam["tglLahir"],
            telp: dataFam["noHp"],
            gender: dataFam["gender"],
            hubungan: dataFam["hubungan"]);

        _family = dataNew;

        final dataResponse =
            await FamilyAPI.updateData(dataNew.toJson(), family!.id);
        if (dataResponse == true) {
          notifyListeners();
          return true;
        }
      }
    }
  }
}
