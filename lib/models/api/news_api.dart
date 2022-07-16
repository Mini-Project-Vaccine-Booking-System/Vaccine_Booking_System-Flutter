import '../../bindings/package_binding.dart';

class NewsAPI {
  static Future getAllData() async {
    try {
      Response response = await PackageBinding.dio.get(
          'https://newsapi.org/v2/everything?q=covid&apiKey=c47dff9434ec4d8d99f40c178fcfe53d&pagesize=10');
      return response;
    } on DioError catch (e) {
      if (e.response != null) {
        return e.response!;
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
        print(e);
      }
    }
  }
}
