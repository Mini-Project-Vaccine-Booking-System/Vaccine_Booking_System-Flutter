import 'package:http/http.dart' as http;

class VaccineAPI {
  static Future getDataById(id, token) async {
    Uri url = Uri.parse(
        'https://vaccine-api-strapi.herokuapp.com/api/vaccines?filters[id][\$eq]=$id');

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
