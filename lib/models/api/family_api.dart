import 'dart:convert';
import 'package:http/http.dart' as http;

class FamilyAPI {
  static Future addData(data) async {
    Uri url =
        Uri.parse("https://booking-vaksin-alta.herokuapp.com/api/kelompok");

    try {
      bool result = false;
      var response = await http.post(url,
          body: jsonEncode(data),
          headers: {"Content-Type": "application/json"});
      if (response.statusCode == 200) {
        result = true;
      }

      return result;
    } catch (e) {
      rethrow;
    }
  }

  static Future getAllData(id) async {
    Uri url = Uri.parse(
        "https://booking-vaksin-alta.herokuapp.com/api/kelompok/user/$id");

    try {
      var response = await http.get(url);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  static Future updateData(data, id) async {
    Uri url =
        Uri.parse("https://booking-vaksin-alta.herokuapp.com/api/kelompok/$id");

    try {
      bool result = false;
      var response = await http.put(url,
          body: jsonEncode(data),
          headers: {"Content-Type": "application/json"});
      if (response.statusCode == 200) {
        result = true;
      }

      return result;
    } catch (e) {
      rethrow;
    }
  }

  static Future deleteData(id) async {
    Uri url =
        Uri.parse("https://booking-vaksin-alta.herokuapp.com/api/kelompok/$id");

    try {
      bool result = false;
      var response = await http.delete(url);
      if (response.statusCode == 200) {
        result = true;
      }

      return result;
    } catch (e) {
      rethrow;
    }
  }
}
