import 'dart:convert';

import 'package:http/http.dart' as http;

class UserAPI {
  static Future checkEmail(String email) async {
    Uri url =
        Uri.parse("https://booking-vaksin-alta.herokuapp.com/api/user/citizen");

    try {
      bool result = true;
      var response = await http.get(url);
      var hasilResponse = jsonDecode(response.body) as Map<String, dynamic>;
      if (hasilResponse["data"].isNotEmpty) {
        hasilResponse["data"].forEach((element) {
          if (element["email"].toString().toLowerCase() ==
              email.toLowerCase()) {
            result = false;
          }
        });
        // for (var element in hasilResponse) {
        //   if (element["email"].toString().toLowerCase() ==
        //       email.toLowerCase()) {
        //     print("dapet nih");
        //     result = false;
        //   }
        // }
      }
      return result;
    } catch (e) {
      rethrow;
    }
  }

  static Future getDataUserById(String id) async {
    Uri url =
        Uri.parse("https://booking-vaksin-alta.herokuapp.com/api/user/$id");

    try {
      var response = await http.get(url);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  static Future updateData(data, id) async {
    Uri url =
        Uri.parse("https://booking-vaksin-alta.herokuapp.com/api/user/$id");

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
}
