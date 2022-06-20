import 'dart:convert';

import 'package:http/http.dart' as http;

class ScheduleAPI {
  static Future getDataByHealth(rs_id) async {
    Uri url = Uri.parse(
        'https://vaccine-13ee4-default-rtdb.asia-southeast1.firebasedatabase.app/schedule.json?orderBy="rs_id"&equalTo="$rs_id"');

    try {
      var response = await http.get(url);
      var dataResponse = jsonDecode(response.body) as Map<String, dynamic>;
      return dataResponse;
    } catch (e) {
      rethrow;
    }
  }
}
