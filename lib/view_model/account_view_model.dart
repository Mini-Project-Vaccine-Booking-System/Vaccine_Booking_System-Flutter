import 'dart:convert';
import 'package:flutter/material.dart';
import '../bindings/model_binding.dart';
import '../bindings/package_binding.dart';
import '../bindings/api_binding.dart';

enum AccountViewState { none, loading, error }

class AccoutnViewModel extends ChangeNotifier {
  AccountViewState _state = AccountViewState.none;
  AccountViewState get state => _state;

  changeState(AccountViewState state) {
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

  User? _data;
  User? get data => _data;

  Family? _family;
  Family? get family => _family;

  Future<void> inisialData() async {
    changeState(AccountViewState.loading);

    try {
      Response response = await UserAPI.getDataUserById(userId.toString());
      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        User dataUser = User(
            id: data["data"]["idUser"],
            email: data["data"]["username"].toString(),
            password: data["data"]["password"].toString(),
            nik: data["data"]["nik"].toString(),
            phone: data["data"]["noHp"].toString(),
            nama: data["data"]["nama"].toString(),
            gender: data["data"]["gender"].toString(),
            tanggalLahir: data["data"]["tglLahir"].toString(),
            image: data["data"]["image"].toString());

        _data = dataUser;
        await getDataFam();
        notifyListeners();
        changeState(AccountViewState.none);
        print("sukses");
      }
    } catch (e) {
      changeState(AccountViewState.error);
    }
  }

  Future updateUser(String hint, newData, [String? oldPassword]) async {
    if (hint == "password") {
      final dataPassword = {
        "currentPassword": oldPassword,
        "newPassword": newData,
      };

      Response dataResponse =
          await UserAPI.updatePassword(dataPassword, token!);
      if (dataResponse.statusCode == 200) {
        notifyListeners();
        return true;
      }
    } else {
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
      Response dataResponse =
          await UserAPI.updateData(_data!.toJson(), userId!, token!);
      await updateFam(hint, newData);
      if (dataResponse.statusCode == 200) {
        notifyListeners();
        return true;
      }
    }
  }

  Future updatePhoto(String photo) async {
    _data!.image = photo;
    Response dataResponse =
        await UserAPI.updateData(_data!.toJson(), userId!, token!);
    if (dataResponse.statusCode == 200) {
      notifyListeners();
      return true;
    }
  }

  Future getDataFam() async {
    late Family dataFam;
    Response response = await FamilyAPI.getAllData(userId);
    if (response.statusCode == 200) {
      final data = response.data as Map<String, dynamic>;
      data["data"].forEach((element) {
        if (element["hubungan"].toString() != "userParent") {
          return;
        }
        dataFam = Family(
            id: element["idKelompok"],
            idParent: userId!,
            name: element["namaKelompok"].toString(),
            nik: element["nik"].toString(),
            tanggalLahir: element["tglLahir"].toString(),
            telp: element["tlp"].toString(),
            gender: element["gender"].toString(),
            hubungan: element["hubungan"].toString());
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

        Response dataResponse =
            await FamilyAPI.updateData(dataNew.toJson(), family!.id, token);
        if (dataResponse.statusCode == 200) {
          notifyListeners();
          return true;
        }
      }
    }
  }
}
