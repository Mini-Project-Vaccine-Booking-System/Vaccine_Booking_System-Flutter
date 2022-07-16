import 'dart:convert';
import '../../bindings/package_binding.dart';

class AuthAPI {
  static Future signup(data) async {
    try {
      Response response = await PackageBinding.dio.post(
          'https://booking-vaksin-alta.herokuapp.com/api/regUser',
          data: jsonEncode(data));
      return response;
    } on DioError catch (e) {
      if (e.response != null) {
        return e.response!;
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
        print(e);
      }
    }
  }

  static Future login(data) async {
    try {
      Response response = await PackageBinding.dio.post(
          'https://booking-vaksin-alta.herokuapp.com/api/login',
          data: jsonEncode(data));
      return response;
    } on DioError catch (e) {
      if (e.response != null) {
        return e.response!;
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
        print(e);
      }
    }
  }
}
