import 'dart:convert';

import 'package:http/http.dart' as http;

class AccountAPI {
  static Future addData(data, token) async {
    Uri url =
        Uri.parse("https://vaccine-api-strapi.herokuapp.com/api/families");

    try {
      var response = await http.post(url, body: jsonEncode(data), headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      });
      var hasilResponse = jsonDecode(response.body) as Map<String, dynamic>;
      print(hasilResponse);
      return hasilResponse;
    } catch (e) {
      rethrow;
    }
  }

  static Future getDataUser(String email) async {
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

  static Future getDataFamilyParent(userId, token) async {
    Uri url = Uri.parse(
        "https://vaccine-api-strapi.herokuapp.com/api/families?filters[user_id][\$eq]=$userId&filters[isParent][\$eq]=true");

    try {
      var response = await http.get(url, headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      });
      return response;
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

  static Future checkEmail(String dataEmail) async {
    Uri url = Uri.parse(
        "https://vaccine-api-strapi.herokuapp.com/api/users?filters[email][\$eq]=${dataEmail}");

    try {
      var response = await http.get(url);
      var hasilResponse = jsonDecode(response.body) as List;
      return hasilResponse;
    } catch (e) {
      rethrow;
    }
  }
}
