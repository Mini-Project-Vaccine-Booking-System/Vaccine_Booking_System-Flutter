import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:vaccine/models/api/hospital_api.dart';
import 'package:vaccine/models/api/schedule_api.dart';
import 'package:vaccine/models/api/ticket_api.dart';
import 'package:vaccine/models/api/vaccine_api.dart';
import 'package:vaccine/models/booking.dart';

import '../models/api/family_api.dart';
import '../models/family.dart';
import '../models/hospital.dart';
import '../models/schedule.dart';
import '../models/vaccine.dart';

class TicketViewModel extends ChangeNotifier {
  Hospital? _hospitalSelect;
  Schedule? _scheduleSelect;
  Vaccine? _vaccineSelect;
  Family? _userSelect;
  int? userId;
  String? token;

  void updateData(uid, tokenData) {
    token = tokenData;
    userId = uid;
    notifyListeners();
  }

  set setHospitalSelect(data) {
    _hospitalSelect = data;
  }

  set setScheduleSelect(data) {
    _scheduleSelect = data;
  }

  set setVaccineSelect(data) {
    _vaccineSelect = data;
  }

  set setUserSelect(data) {
    _userSelect = data;
  }

  Hospital? get hospitalSelect => _hospitalSelect;
  Schedule? get scheduleSelect => _scheduleSelect;
  Vaccine? get vaccineSelect => _vaccineSelect;
  Family? get userSelect => _userSelect;

  List<Booking> _userVaccine = [];
  List<Booking> get userVaccine => _userVaccine;

  late Booking _bookingSelect;
  Booking get bookingSelect => _bookingSelect;

  Future saveTicket({family_id, shcedule_id, vaccine_id, hospital_id}) async {
    final dataTicket = {
      "family_id": family_id,
      "schedule_id": shcedule_id,
      "vaccine_id": vaccine_id,
      "hospital_id": hospital_id
    };

    Response data = await TicketAPI.addData({"data": dataTicket}, token);
    if (data.statusCode == 200) {
      return true;
    }
  }

  Future initialData() async {
    await getUserHistory();
    await getUserIdentity();
    await getHospitalIdentity();
    await getScheduleIdentity();
    await getVaccineIdentity();
  }

  Future getUserHistory() async {
    _userVaccine.clear();
    Response ticketsResponse = await TicketAPI.getAllTicket(userId, token);
    if (ticketsResponse.statusCode == 200) {
      var ticket = jsonDecode(ticketsResponse.body) as Map<String, dynamic>;
      if (ticket["data"].length > 0) {
        for (var element in ticket["data"]) {
          Booking data = Booking(
              id: element["id"],
              family_id: element["attributes"]["family_id"],
              schedule_id: element["attributes"]["schedule_id"],
              vaccine_id: element["attributes"]["vaccine_id"],
              hospital_id: element["attributes"]["hospital_id"],
              userName: "",
              userNik: "",
              userHospitalName: "",
              userHospitalAddress: "",
              userScheduleStart: "",
              userScheduleEnd: "",
              userVaccineName: "");

          _userVaccine.add(data);
        }
      }
    }
  }

  Future getUserIdentity() async {
    if (_userVaccine.isNotEmpty) {
      for (var element in _userVaccine) {
        Response userResponse =
            await FamilyAPI.getDataById(element.family_id, token);
        if (userResponse.statusCode == 200) {
          var user = jsonDecode(userResponse.body) as Map<String, dynamic>;
          element.userName =
              user["data"][0]["attributes"]["fullname"].toString();
          element.userNik = user["data"][0]["attributes"]["nik"].toString();
        }
      }
    }
  }

  Future getHospitalIdentity() async {
    if (_userVaccine.isNotEmpty) {
      for (var element in _userVaccine) {
        Response userResponse =
            await HospitalAPI.getDataById(element.hospital_id, token);
        if (userResponse.statusCode == 200) {
          var user = jsonDecode(userResponse.body) as Map<String, dynamic>;
          element.userHospitalName =
              user["data"][0]["attributes"]["name"].toString();
          element.userHospitalAddress =
              user["data"][0]["attributes"]["address"].toString();
        }
      }
    }
  }

  Future getScheduleIdentity() async {
    if (_userVaccine.isNotEmpty) {
      for (var element in _userVaccine) {
        Response userResponse =
            await ScheduleAPI.getDataById(element.schedule_id, token);
        if (userResponse.statusCode == 200) {
          var user = jsonDecode(userResponse.body) as Map<String, dynamic>;
          element.userScheduleStart =
              user["data"][0]["attributes"]["start"].toString();
          element.userScheduleEnd =
              user["data"][0]["attributes"]["end"].toString();
        }
      }
    }
  }

  Future getVaccineIdentity() async {
    if (_userVaccine.isNotEmpty) {
      for (var element in _userVaccine) {
        Response userResponse =
            await VaccineAPI.getDataById(element.vaccine_id, token);
        if (userResponse.statusCode == 200) {
          var user = jsonDecode(userResponse.body) as Map<String, dynamic>;
          element.userVaccineName =
              user["data"][0]["attributes"]["name"].toString();
        }
      }
    }
  }

  Future getDetailPass(id) async {
    _bookingSelect = userVaccine.firstWhere((element) => element.id == id);
    print(bookingSelect);
  }
}
