import 'dart:convert';
import '../../bindings/package_binding.dart';

class FamilyAPI {
  static Future addData(data, token) async {
    try {
      Response response = await PackageBinding.dio
          .post('https://booking-vaksin-alta.herokuapp.com/api/kelompok',
              data: jsonEncode(data),
              options: Options(headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
                'Authorization': 'Bearer $token',
              }));
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

  static Future getAllData(id) async {
    try {
      Response response = await PackageBinding.dio.get(
          'https://booking-vaksin-alta.herokuapp.com/api/kelompok/user/$id');
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

  static Future updateData(data, id, token) async {
    try {
      Response response = await PackageBinding.dio.put(
          'https://booking-vaksin-alta.herokuapp.com/api/kelompok/$id',
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

  static Future deleteData(id, token) async {
    try {
      Response response = await PackageBinding.dio.delete(
          'https://booking-vaksin-alta.herokuapp.com/api/kelompok/$id',
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
