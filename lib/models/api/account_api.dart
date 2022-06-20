import 'dart:convert';

import 'package:http/http.dart' as http;

class AccountAPI {
  static Future addData(data) async {
    Uri url = Uri.parse(
        "https://vaccine-13ee4-default-rtdb.asia-southeast1.firebasedatabase.app/accounts.json");

    try {
      var response = await http.post(url, body: jsonEncode(data));
      var hasilResponse = jsonDecode(response.body) as Map<String, dynamic>;
      // print(hasilResponse["name"]);
      return hasilResponse["name"];
    } catch (e) {
      rethrow;
    }
  }

  static Future getData(String email) async {
    Uri url = Uri.parse(
        'https://vaccine-13ee4-default-rtdb.asia-southeast1.firebasedatabase.app/accounts.json?orderBy="email"&equalTo="$email"');

    try {
      var response = await http.get(url);
      var hasilResponse = jsonDecode(response.body) as Map<String, dynamic>;
      return hasilResponse;
    } catch (e) {
      rethrow;
    }
  }

  static Future getDataById(userId) async {
    print(userId);
    Uri url = Uri.parse(
        "https://vaccine-13ee4-default-rtdb.asia-southeast1.firebasedatabase.app/accounts/$userId.json");

    try {
      var response = await http.get(url);
      var hasilResponse = jsonDecode(response.body) as Map<String, dynamic>;
      return hasilResponse;
    } catch (e) {
      rethrow;
    }
  }

  static Future updateDataById(userId, data) async {
    Uri url = Uri.parse(
        "https://vaccine-13ee4-default-rtdb.asia-southeast1.firebasedatabase.app/accounts/$userId.json");

    try {
      var response = await http.patch(url, body: data);
      var hasilResponse = jsonDecode(response.body);
      return hasilResponse;
    } catch (e) {
      rethrow;
    }
  }
}
