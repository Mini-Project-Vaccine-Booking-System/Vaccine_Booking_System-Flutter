import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vaccine/models/api/account_api.dart';
import 'package:vaccine/models/api/family_api.dart';
import 'package:vaccine/models/api/user_api.dart';

import '../models/account.dart';
import '../models/family.dart';
import '../models/user.dart';

class AuthViewModel extends ChangeNotifier {
  // String? _token;
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

  // String? get token {
  //   if (_token != null) {
  //     return _token;
  //   } else {
  //     return null;
  //   }
  // }

  bool get isAuth {
    return _parentId != null;
  }

  Future checkEmail(String email) async {
    final data = await UserAPI.checkEmail(email.toLowerCase());
    return data;
  }

  Future _authenticate(String email, password, status,
      [String? name,
      String? nik,
      DateTime? tanggal_lahir,
      String? phone,
      String? gender]) async {
    Uri url;
    User? dataRegister;
    if (status == "login") {
      // url =
      //     Uri.parse("https://vaccine-api-strapi.herokuapp.com/api/auth/local");
      // data = {"identifier": email, "password": password};
      url = Uri.parse(
          "https://booking-vaksin-alta.herokuapp.com/api/user/citizen");
    } else {
      // url = Uri.parse(
      //     "https://vaccine-api-strapi.herokuapp.com/api/auth/local/register");
      // data = {"username": name, "email": email, "password": password};
      dataRegister = User(
          id: 0,
          email: email,
          password: password,
          nik: nik!,
          phone: phone!,
          nama: name!,
          gender: gender!,
          image: "",
          tanggalLahir: tanggal_lahir!);
      url = Uri.parse("https://booking-vaksin-alta.herokuapp.com/api/user");
    }

    try {
      if (status == "login") {
        final userResponse = await http.get(url);
        if (userResponse.statusCode == 200) {
          final response = jsonDecode(userResponse.body) as List;
          for (var element in response) {
            if (element["email"] == email && element["password"] == password) {
              _parentId = element["idUser"];
              _email = element["email"].toString();
              _password = element["password"].toString();

              final prefs = await SharedPreferences.getInstance();
              final userData = jsonEncode(
                {
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
            } else {
              return false;
            }
          }
        }
      } else {
        var checkEmail = await UserAPI.checkEmail(email);
        if (checkEmail == true) {
          final userResponse = await http.post(url,
              body: jsonEncode(dataRegister!.toJson()),
              headers: {"Content-Type": "application/json"});
          if (userResponse.statusCode == 200) {
            final response =
                jsonDecode(userResponse.body) as Map<String, dynamic>;
            _parentId = response["idUser"];
            _email = response["email"].toString();
            _password = response["password"].toString();

            final prefs = await SharedPreferences.getInstance();
            final userData = jsonEncode(
              {
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
        } else {
          return false;
        }
      }
    } catch (e) {
      print(e);
      return false;
    }

    // try {
    //   print(jsonEncode(data));
    //   final response = await http.post(url,
    //       body: jsonEncode(data),
    //       headers: {"Content-Type": "application/json"});
    //   print("Response ${response.body}");
    //   if (response.statusCode == 200) {
    //     final responseData = jsonDecode(response.body) as Map<String, dynamic>;
    //     _token = responseData['jwt'];
    //     _parentId = responseData["user"]["id"];
    //     _email = email;
    //     _password = password;

    //     final prefs = await SharedPreferences.getInstance();
    //     final userData = jsonEncode(
    //       {
    //         'token': _token,
    //         'parentId': _parentId,
    //         'email': _email,
    //         'password': _password,
    //       },
    //     );

    //     if (prefs.containsKey('userData')) {
    //       await prefs.remove('userData');
    //     }

    //     await prefs.setString(
    //       'userData',
    //       userData,
    //     );

    //     notifyListeners();
    //     return true;
    //   }
    // } catch (e) {
    //   print(e);
    //   return false;
    // }
  }

  Future signUp(String username, String nik, DateTime tanggalLahir, String telp,
      String gender) async {
    final data = await _authenticate(
      email,
      password,
      "register",
      username,
      nik,
      tanggalLahir,
      telp,
      gender,
    );


    if (data == true) {
      Family dataFamily = Family(
          id: 0,
          idParent: parentId!,
          name: username,
          nik: nik,
          tanggalLahir: tanggalLahir,
          telp: telp,
          gender: gender,
          hubungan: "userParent");

      bool responseFamily = await FamilyAPI.addData(dataFamily.toJson());
      if (responseFamily == true) {
        return true;
      }
      // var userData = Account(
      //     id: 0,
      //     idUser: parentId!,
      //     name: username,
      //     email: email,
      //     password: password,
      //     nik: nik,
      //     usia: usia,
      //     telp: telp,
      //     gender: gender,
      //     photo: "",
      //     createdAt: DateTime.now(),
      //     isParent: true);

      // await AccountAPI.addData({"data": userData.toJson()}, _token);
      // return true;
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

    // _token = extractedUserData["token"];
    _parentId = extractedUserData["parentId"];
    _email = extractedUserData["email"];
    _password = extractedUserData["password"];
    notifyListeners();
  }

  Future<void> logOut() async {
    // _token = null;
    _parentId = null;
    _email = "";
    _password = "";
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    prefs.remove('userData');
    prefs.clear();
  }
}
