import 'dart:convert';

import 'package:http/http.dart' as http;

class HealthAPI {
  static Future getDataByCity(city) async {
    Uri url = Uri.parse(
        'https://vaccine-13ee4-default-rtdb.asia-southeast1.firebasedatabase.app/health.json?orderBy="city"&equalTo="$city"');

    try {
      var response = await http.get(url);
      var dataResponse = jsonDecode(response.body) as Map<String, dynamic>;
      return dataResponse;
    } catch (e) {
      rethrow;
    }
  }
}
