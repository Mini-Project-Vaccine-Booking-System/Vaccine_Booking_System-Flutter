import 'dart:convert';
import 'package:http/http.dart' as http;

class TicketAPI {
  static Future addData(data) async {
    Uri url =
        Uri.parse("https://booking-vaksin-alta.herokuapp.com/api/booking");

    try {
      var response = await http.post(url,
          body: jsonEncode(data),
          headers: {"Content-Type": "application/json"});
      return response;
    } catch (e) {
      rethrow;
    }
  }

  static Future getAllTicket(id) async {
    Uri url = Uri.parse(
        "https://booking-vaksin-alta.herokuapp.com/api/booking/s/$id");

    try {
      var response = await http.get(url);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
