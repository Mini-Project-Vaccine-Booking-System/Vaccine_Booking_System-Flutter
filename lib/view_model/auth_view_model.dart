import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vaccine/models/api/account_api.dart';
import 'package:vaccine/models/api/family_api.dart';
import 'package:vaccine/models/family.dart';

import '../models/account.dart';

class AuthViewModel extends ChangeNotifier {
  String? _userId;
  String? _userFamily;
  String? _userEmail;
  String? _password;
  bool _auth = false;

  String? get userId {
    return _userId;
  }

  String? get userFamily {
    return _userFamily;
  }

  bool get isAuth {
    return _auth;
  }

  Future _authenticate() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      final userData = jsonEncode(
        {
          'userId': _userId,
          'userFamily': _userFamily,
          'email': _userEmail,
          'password': _password,
        },
      );
      if (prefs.containsKey('userData')) {
        await prefs.remove('userData');
      }
      await prefs.setString(
        'userData',
        userData,
      );

      _auth = true;

      notifyListeners();
      return true;
    } catch (e) {
      // print(e);
    }
  }

  Future signUp(String idUser, name, email, password, nik, usia, telp, gender,
      photo) async {
    var userData = Account(
        idUser: idUser,
        name: name,
        email: email,
        password: password,
        nik: nik,
        usia: usia,
        telp: telp,
        gender: gender,
        photo: photo,
        createdAt: DateTime.now());

    final data = await AccountAPI.addData(userData.toJson());
    var familyData = Family(
        idUser: data,
        idFamily: "",
        name: name,
        createdAt: DateTime.now(),
        nik: nik,
        usia: usia,
        telp: telp,
        gender: gender);
    var family = await FamilyAPI.addData(familyData.toJson());
    if (data != null && family != null) {
      _userId = data;
      _userFamily = family;
      _userEmail = email;
      _password = password;
      await _authenticate();
      return true;
    } else {
      return data;
    }
  }

  Future signIn(String email, String password) async {
    final data = await AccountAPI.getData(email);
    if (data.length == 0) {}
    data.forEach((keyData, valueData) async {
      if (valueData["password"] != password) {}
      final familyAdmin = await FamilyAPI.isAdmin();
      if (familyAdmin.length == 0) {}
      familyAdmin.forEach((keyFamily, valueFamily) async {
        if (valueFamily["idUser"] == keyData) {
          _userId = keyData;
          _userFamily = keyFamily;
          _userEmail = email;
          _password = password;
          await _authenticate();
          return true;
        }
      });
    });
  }

  Future<void> autoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) {
      return;
    }

    final extractedUserData =
        jsonDecode(prefs.getString('userData').toString());
    final email = extractedUserData['email'].toString();
    final password = extractedUserData['password'].toString();

    if (email.length > 0 && password.length > 0) {
      _auth = true;
    }

    _userFamily = extractedUserData['userFamily'].toString();
    _userId = extractedUserData['userId'].toString();
    _userEmail = extractedUserData['email'].toString();
    _password = extractedUserData['password'].toString();
    notifyListeners();
  }

  Future<void> logOut() async {
    // _userId = null;
    // _userFamily = null;
    // _userEmail = null;
    // _password = null;
    _auth = false;
    notifyListeners();
    // final prefs = await SharedPreferences.getInstance();
    // prefs.remove('userData');
    // prefs.clear();
  }
}
