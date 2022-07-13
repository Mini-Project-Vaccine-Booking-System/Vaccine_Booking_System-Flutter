import 'package:http/http.dart' as http;

class NewsAPI {
  static Future getDataHome() async {
    Uri url = Uri.parse(
        'https://newsapi.org/v2/everything?q=covid&apiKey=c47dff9434ec4d8d99f40c178fcfe53d&pagesize=10');

    try {
      var response = await http.get(url);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  static Future getData() async {
    Uri url = Uri.parse(
        'https://newsapi.org/v2/everything?q=covid&apiKey=c47dff9434ec4d8d99f40c178fcfe53d&pagesize=10');

    try {
      var response = await http.get(url);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
