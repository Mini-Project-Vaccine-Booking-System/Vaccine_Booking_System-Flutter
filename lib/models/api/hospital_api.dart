import '../../bindings/package_binding.dart';

class HospitalAPI {
  static Future getDataByCity(city, date) async {
    try {
      Response response = await PackageBinding.dio.get(
          'https://booking-vaksin-alta.herokuapp.com/api/session/date/$date/$city');
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
