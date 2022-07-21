import 'dart:convert';
import '../../bindings/package_binding.dart';

class UserAPI {
  static Future getDataUserById(id) async {
    try {
      Response response = await PackageBinding.dio
          .get('https://booking-vaksin-alta.herokuapp.com/api/user/$id');
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

  static Future updateData(Map data, int id, String token) async {
    try {
      Response response = await PackageBinding.dio.put(
          'https://booking-vaksin-alta.herokuapp.com/api/user/$id',
          data: jsonEncode(data),
          options: Options(headers: {"Authorization": "Bearer $token"}));
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

  static Future updatePassword(Map data, String token) async {
    try {
      Response response = await PackageBinding.dio.put(
          'https://booking-vaksin-alta.herokuapp.com/api/user/change-password',
          data: jsonEncode(data),
          options: Options(headers: {"Authorization": "Bearer $token"}));
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
