import 'dart:convert';
import '../../bindings/package_binding.dart';

class TicketAPI {
  static Future addData(data, token) async {
    try {
      Response response = await PackageBinding.dio.post(
          'https://booking-vaksin-alta.herokuapp.com/api/booking',
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

  static Future getAllTicket(id) async {
    try {
      Response response = await PackageBinding.dio.get(
        'https://booking-vaksin-alta.herokuapp.com/api/booking/s/$id',
      );
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
