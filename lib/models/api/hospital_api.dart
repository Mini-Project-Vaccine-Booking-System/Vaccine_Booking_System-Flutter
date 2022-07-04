import 'dart:convert';

import 'package:http/http.dart' as http;

class HospitalAPI {
  static Future getDataByCity(city, date) async {
    Uri url = Uri.parse(
        'https://booking-vaksin-alta.herokuapp.com/api/session/date/$date/$city');

    try {
      var response = await http.get(url);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  static Future getDataById(id, token) async {
    Uri url = Uri.parse(
        'https://vaccine-api-strapi.herokuapp.com/api/hospitals?filters[id][\$eq]=$id');

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

  static Future checkSchedule(id, token) async {
    Uri url = Uri.parse(
        'https://vaccine-api-strapi.herokuapp.com/api/schedules?filters[hospital_id][\$eq]=$id');

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

  static Future getVaccineBySchedule(id, token) async {
    Uri url = Uri.parse(
        'https://vaccine-api-strapi.herokuapp.com/api/vaccine-availabilities?filters[schedule_id][\$eq]=$id');

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

  static Future getVaccineName(id, token) async {
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
