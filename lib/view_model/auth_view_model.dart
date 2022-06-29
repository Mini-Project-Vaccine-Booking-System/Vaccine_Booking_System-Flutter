import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vaccine/models/api/account_api.dart';

import '../models/account.dart';

class AuthViewModel extends ChangeNotifier {
  String? _token;
  int? _parentId;
  late String _email;
  late String _password;

  set email(String emailInput) {
    _email = emailInput;
    notifyListeners();
  }

  set password(String passwordInput) {
    _password = passwordInput;
    notifyListeners();
  }

  String get email => _email;
  String get password => _password;

  int? get parentId {
    return _parentId;
  }

  String? get token {
    if (_token != null) {
      return _token;
    } else {
      return null;
    }
  }

  bool get isAuth {
    return _token != null;
  }

  Future checkEmail(String email) async {
    final data = await AccountAPI.checkEmail(email.toLowerCase());
    return data;
  }

  Future _authenticate(String email, password, status, [String? name]) async {
    var url;
    var data;
    if (status == "login") {
      url =
          Uri.parse("https://vaccine-api-strapi.herokuapp.com/api/auth/local");
      data = {"identifier": email, "password": password};
    } else {
      url = Uri.parse(
          "https://vaccine-api-strapi.herokuapp.com/api/auth/local/register");
      data = {"username": name, "email": email, "password": password};
    }

    try {
      print(jsonEncode(data));
      final response = await http.post(url,
          body: jsonEncode(data),
          headers: {"Content-Type": "application/json"});
      print("Response ${response.body}");
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body) as Map<String, dynamic>;
        _token = responseData['jwt'];
        _parentId = responseData["user"]["id"];
        _email = email;
        _password = password;

        final prefs = await SharedPreferences.getInstance();
        final userData = jsonEncode(
          {
            'token': _token,
            'parentId': _parentId,
            'email': _email,
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

        notifyListeners();
        return true;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future signUp(String username, nik, usia, telp, gender) async {
    final data = await _authenticate(email, password, "register", username);
    print("Data $data");

    if (data == true) {
      var userData = Account(
          id: 0,
          idUser: parentId!,
          name: username,
          email: email,
          password: password,
          nik: nik,
          usia: usia,
          telp: telp,
          gender: gender,
          photo: "",
          createdAt: DateTime.now(),
          isParent: true);

      await AccountAPI.addData({"data": userData.toJson()}, _token);
      return true;
    } else {
      return false;
    }
  }

  Future signIn(String email, String password) async {
    final data = await _authenticate(email, password, "login");
    if (data == true) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> autoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) {
      return;
    }

    final extractedUserData = jsonDecode(prefs.getString('userData').toString())
        as Map<String, dynamic>;

    _token = extractedUserData["token"];
    _parentId = extractedUserData["parentId"];
    _email = extractedUserData["email"];
    _password = extractedUserData["password"];
    notifyListeners();
  }

  Future<void> logOut() async {
    _token = null;
    _parentId = null;
    _email = "";
    _password = "";
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    prefs.remove('userData');
    prefs.clear();
  }
}
