import 'dart:convert';
import '../../bindings/package_binding.dart';

class CovidAPI {
  static Future getData(date) async {
    try {
      Response response = await PackageBinding.dio.get(
          'https://covid-193.p.rapidapi.com/history?country=indonesia&day=$date',
          options: Options(headers: {
            "X-RapidAPI-Key":
                "e8c276c21emshe992b24cbf34eb1p198320jsnadaf0b414358",
            "X-RapidAPI-Host": "covid-193.p.rapidapi.com"
          }));
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
