import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import '../bindings/package_binding.dart';
import '../bindings/model_binding.dart';
import '../bindings/api_binding.dart';

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
    return token != null;
  }

  Future signUp() async {
    User data = User(
        id: 0,
        email: email,
        password: password,
        nik: Random().nextInt(10000000000).toString(),
        phone: "",
        nama: "",
        gender: "",
        image: "",
        tanggalLahir: "");
    Response signup = await AuthAPI.signup(data);
    print(signup.data);
    if (signup.statusCode == 201) {
      final signin = await signIn();
      print(signin);
      return signin;
    } else {
      return false;
    }
  }

  Future signIn() async {
    var data = {"email": email, "password": password};
    Response login = await AuthAPI.login(data);
    print(login.statusCode);
    print(login.data);
    if (login.statusCode == 200) {
      final response = login.data as Map<String, dynamic>;
      _token = response["token"].toString();
      _parentId = response["user"]["idUser"];
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

      if (prefs.containsKey("userData")) {
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

  Future fillData(String nik, String noHp, String nama, String gender,
      DateTime tglLahir, String image) async {
    User dataUser = User(
        id: 0,
        email: email,
        password: password,
        nik: nik,
        phone: noHp,
        nama: nama,
        gender: gender,
        tanggalLahir: tglLahir.toIso8601String(),
        image: image);

    Family family = Family(
        id: 0,
        idParent: parentId!,
        name: nama,
        nik: nik,
        tanggalLahir: tglLahir.toIso8601String(),
        telp: noHp,
        gender: gender,
        hubungan: "userParent");

    Response fillDataUser =
        await UserAPI.updateData(dataUser.toJson(), parentId!, token!);
    print(fillDataUser.statusCode);
    print(fillDataUser.data);
    if (fillDataUser.statusCode == 200) {
      Response response = await FamilyAPI.addData(family.toJson(), token);
      print(response.statusCode);
      if (response.statusCode == 200) {
        return true;
      }
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
