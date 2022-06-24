import 'dart:convert';
import 'package:http/http.dart' as http;

class TicketAPI {
  static Future addData(data, token) async {
    Uri url = Uri.parse("https://vaccine-api-strapi.herokuapp.com/api/tickets");

    try {
      var response = await http.post(url, body: jsonEncode(data), headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      });
      return response;
    } catch (e) {
      rethrow;
    }
  }

  static Future getAllTicket(id, token) async {
    Uri url = Uri.parse(
        "https://vaccine-api-strapi.herokuapp.com/api/tickets?filters[parent_id][\$eq]=$id");

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
}
