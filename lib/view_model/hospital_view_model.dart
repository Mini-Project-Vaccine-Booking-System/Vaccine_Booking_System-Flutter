import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:vaccine/models/api/hospital_api.dart';
import 'package:vaccine/models/hospital.dart';
import 'package:vaccine/models/schedule.dart';
import 'package:vaccine/models/session.dart';
import 'package:vaccine/models/vaccine.dart';

class HospitalViewModel extends ChangeNotifier {
  int? userId;
  String? token;

  void updateData(
    uid,
    /* tokenData */
  ) {
    // token = tokenData;
    userId = uid;
    notifyListeners();
  }

  List<Session> _dataSession = [];
  List<Session> get dataSession => _dataSession;

  List<Session> _dataHome = [];
  List<Session> get dataHome => _dataHome;

  List<Hospital> _data = [];
  List<Hospital> get data => _data;

  List<Schedule> _dataDate = [];
  List<Schedule> get dataDate => _dataDate;

  List<Vaccine> _dataVaccine = [];
  List<Vaccine> get dataVaccine => _dataVaccine;

  late Session dataSelect;

  Future homeData() async {
    var dateNow = DateTime.now();
    _dataHome.clear();
    // print(DateFormat("yyyy-MM-dd").format(dateNow));
    Response data = await HospitalAPI.getDataByCity("Yogyakarta", "2022-06-28");
    if (data.statusCode == 200) {
      final sessions = jsonDecode(data.body) as List<dynamic>;
      if (sessions.isNotEmpty) {
        for (var session in sessions) {
          Session data = Session(
              id: session["idSession"],
              name: session["vaksin"]["user"]["nama"].toString(),
              address: session["vaksin"]["user"]["address"].toString(),
              start: session["start"].toString(),
              end: session["end"].toString(),
              vaccine: session["vaksin"]["nama"].toString(),
              stock: session["vaksin"]["quantity"],
              date: DateTime.parse(session["date"].toString()));

          _dataHome.add(data);
          notifyListeners();
        }

        return true;
      } else {
        return "data tidak ditemukan";
      }
    }
  }

  Future getDataByCity(String city, date) async {
    _dataSession.clear();
    Response data = await HospitalAPI.getDataByCity(city, date);
    if (data.statusCode == 200) {
      final sessions = jsonDecode(data.body) as List<dynamic>;
      if (sessions.isNotEmpty) {
        for (var session in sessions) {
          Session data = Session(
              id: session["idSession"],
              name: session["vaksin"]["user"]["nama"].toString(),
              address: session["vaksin"]["user"]["address"].toString(),
              start: session["start"].toString(),
              end: session["end"].toString(),
              vaccine: session["vaksin"]["nama"].toString(),
              stock: session["vaksin"]["quantity"],
              date: DateTime.parse(session["date"].toString()));

          _dataSession.add(data);
          notifyListeners();
        }
        /*   for (var value in dataHospital["data"]) {
          Response schedules =
              await HospitalAPI.checkSchedule(value["id"], token);
          final dataSchedules =
              jsonDecode(schedules.body) as Map<String, dynamic>;
          Hospital data = Hospital(
              id: value["id"],
              name: value["attributes"]["name"].toString(),
              address: value["attributes"]["address"].toString(),
              city: value["attributes"]["city"].toString(),
              availability: dataSchedules["data"].length > 0 ? true : false);

          _data.add(data);
          notifyListeners();
        }*/

        return true;
      } else {
        return "data tidak ditemukan";
      }
    }
  }

  Future getSchedule(id) async {
    _dataDate.clear();
    Response schedules = await HospitalAPI.checkSchedule(id, token);
    if (schedules.statusCode == 200) {
      final dataSchedules = jsonDecode(schedules.body) as Map<String, dynamic>;
      for (var value in dataSchedules["data"]) {
        Schedule data = Schedule(
            id: value["id"],
            start: value["attributes"]["start"].toString(),
            end: value["attributes"]["end"].toString());
        _dataDate.add(data);
        notifyListeners();
      }
    }
  }

  Future getVaccineBySchedule(id) async {
    _dataVaccine.clear();
    Response vaccineAvailability =
        await HospitalAPI.getVaccineBySchedule(id, token);
    if (vaccineAvailability.statusCode == 200) {
      final data = jsonDecode(vaccineAvailability.body) as Map<String, dynamic>;
      for (var value in data["data"]) {
        Vaccine item =
            Vaccine(id: value["attributes"]["vaccine_id"], name: "", stock: 0);
        _dataVaccine.add(item);
        notifyListeners();
      }
    }
  }

  Future getVaccineName(id) async {
    Response vaccine = await HospitalAPI.getVaccineName(id, token);
    if (vaccine.statusCode == 200) {
      final data = jsonDecode(vaccine.body) as Map<String, dynamic>;
      for (var value in data["data"]) {
        for (var element in _dataVaccine) {
          if (element.id == id) {
            element.name = value["attributes"]["name"];
          }
        }
        notifyListeners();
      }
    }
  }

  Future getVaccine(id) async {
    await getVaccineBySchedule(id);

    if (dataVaccine.length > 0) {
      for (var item in _dataVaccine) {
        await getVaccineName(item.id);
      }
    }
  }
}
