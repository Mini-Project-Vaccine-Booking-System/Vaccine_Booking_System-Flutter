import 'package:flutter/material.dart';
import 'package:vaccine/models/api/health.dart';
import 'package:vaccine/models/api/schedule_api.dart';
import 'package:vaccine/models/health.dart';
import 'package:vaccine/models/schedule.dart';

class BookingViewModel extends ChangeNotifier {
  List _dataRumahSakit = [];
  List get data => _dataRumahSakit;

  List<Schedule> _schedule = [];
  List<Schedule> get schedule => _schedule;

  late Health dataPick;

  Future getHealthByCity(String city) async {
    final dataResponse = await HealthAPI.getDataByCity(city);
    if (dataResponse.length == 0) {}
    _dataRumahSakit.clear();
    dataResponse.forEach((key, value) async {
      final dataSchedule = await ScheduleAPI.getDataByHealth(key);
      Health data = Health(
          idHealth: key,
          address: value["address"],
          city: value["city"],
          name: value["name"],
          schedule: dataSchedule.length > 0 ? true : false);

      _dataRumahSakit.add(data);
      notifyListeners();
    });
  }

  Future getSchedule(String id) async {
    dataPick = data.firstWhere((element) => element.idHealth == id);
    final dataSchedule = await ScheduleAPI.getDataByHealth(id);
    dataSchedule.forEach((key, value) {
      value["jadwal"].forEach((key, value) {
        List<Map<String, dynamic>> data = [key, value];
        var dataJadwal = Schedule(jadwal: data);
        _schedule.add(dataJadwal);
      });
    });

    notifyListeners();
  }
}
