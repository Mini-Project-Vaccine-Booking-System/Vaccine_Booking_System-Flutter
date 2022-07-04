import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:vaccine/models/api/hospital_api.dart';
import 'package:vaccine/models/api/schedule_api.dart';
import 'package:vaccine/models/api/ticket_api.dart';
import 'package:vaccine/models/api/vaccine_api.dart';
import 'package:vaccine/models/booking.dart';
import 'package:vaccine/models/ticket.dart';

import '../models/api/family_api.dart';
import '../models/family.dart';
import '../models/hospital.dart';
import '../models/schedule.dart';
import '../models/vaccine.dart';

class TicketViewModel extends ChangeNotifier {
  // Hospital? _hospitalSelect;
  // Schedule? _scheduleSelect;
  // Vaccine? _vaccineSelect;
  // Family? _userSelect;
  int? userId;
  late Ticket _ticketSelect;
  // String? token;

  void updateData(
    uid,
    /* tokenData */
  ) {
    // token = tokenData;
    userId = uid;
    notifyListeners();
  }

  // set setHospitalSelect(data) {
  //   _hospitalSelect = data;
  // }

  // set setScheduleSelect(data) {
  //   _scheduleSelect = data;
  // }

  // set setVaccineSelect(data) {
  //   _vaccineSelect = data;
  // }

  // set setUserSelect(data) {
  //   _userSelect = data;
  // }

  // Hospital? get hospitalSelect => _hospitalSelect;
  // Schedule? get scheduleSelect => _scheduleSelect;
  // Vaccine? get vaccineSelect => _vaccineSelect;
  // Family? get userSelect => _userSelect;

  set setTikectSelect(Ticket data) {
    _ticketSelect = data;
  }

  Ticket get ticketSelect => _ticketSelect;

  List<Ticket> _dataTicket = [];
  List<Ticket> get dataTicket => _dataTicket;

  // late Booking _bookingSelect;
  // Booking get bookingSelect => _bookingSelect;

  Future saveTicket(Ticket data) async {
    _ticketSelect = data;
    _dataTicket.add(data);
    Response response = await TicketAPI.addData(data.toJson());
    if (response.statusCode == 200) {
      notifyListeners();
      return true;
    }
  }

  Future initialData() async {
    _dataTicket.clear();
    Response response = await TicketAPI.getAllTicket(userId);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as List;
      for (var element in data) {
        Ticket ticket = Ticket(
            idBooking: element["idBooking"],
            idKelompok: element["kelompok"]["idKelompok"],
            idRumahSakit: element["session"]["vaksin"]["user"]["idUser"],
            idSession: element["session"]["idSession"],
            namaRumahSakit:
                element["session"]["vaksin"]["user"]["nama"].toString(),
            alamatRumahSakit:
                element["session"]["vaksin"]["user"]["address"].toString(),
            kotaRumahSakit:
                element["session"]["vaksin"]["user"]["kota"].toString(),
            nik: element["kelompok"]["nik"].toString(),
            namaPasien: element["kelompok"]["namaKelompok"].toString(),
            dateSession: DateTime.parse(element["session"]["date"].toString()),
            start: element["session"]["start"].toString(),
            end: element["session"]["end"].toString(),
            namaVaksin: element["session"]["vaksin"]["nama"]);

        _dataTicket.add(ticket);
        notifyListeners();
      }

      return true;
    }
  }

  // Future getUserHistory() async {
  //   _userVaccine.clear();
  //   Response ticketsResponse = await TicketAPI.getAllTicket(userId, token);
  //   if (ticketsResponse.statusCode == 200) {
  //     var ticket = jsonDecode(ticketsResponse.body) as Map<String, dynamic>;
  //     if (ticket["data"].length > 0) {
  //       for (var element in ticket["data"]) {
  //         Booking data = Booking(
  //             id: element["id"],
  //             family_id: element["attributes"]["family_id"],
  //             schedule_id: element["attributes"]["schedule_id"],
  //             vaccine_id: element["attributes"]["vaccine_id"],
  //             hospital_id: element["attributes"]["hospital_id"],
  //             userName: "",
  //             userNik: "",
  //             userHospitalName: "",
  //             userHospitalAddress: "",
  //             userScheduleStart: "",
  //             userScheduleEnd: "",
  //             userVaccineName: "");

  //         _userVaccine.add(data);
  //       }
  //     }
  //   }
  // }

  // Future getUserIdentity() async {
  //   if (_userVaccine.isNotEmpty) {
  //     for (var element in _userVaccine) {
  //       Response userResponse =
  //           await FamilyAPI.getDataById(element.family_id, token);
  //       if (userResponse.statusCode == 200) {
  //         var user = jsonDecode(userResponse.body) as Map<String, dynamic>;
  //         element.userName =
  //             user["data"][0]["attributes"]["fullname"].toString();
  //         element.userNik = user["data"][0]["attributes"]["nik"].toString();
  //       }
  //     }
  //   }
  // }

  // Future getHospitalIdentity() async {
  //   if (_userVaccine.isNotEmpty) {
  //     for (var element in _userVaccine) {
  //       Response userResponse =
  //           await HospitalAPI.getDataById(element.hospital_id, token);
  //       if (userResponse.statusCode == 200) {
  //         var user = jsonDecode(userResponse.body) as Map<String, dynamic>;
  //         element.userHospitalName =
  //             user["data"][0]["attributes"]["name"].toString();
  //         element.userHospitalAddress =
  //             user["data"][0]["attributes"]["address"].toString();
  //       }
  //     }
  //   }
  // }

  // Future getScheduleIdentity() async {
  //   if (_userVaccine.isNotEmpty) {
  //     for (var element in _userVaccine) {
  //       Response userResponse =
  //           await ScheduleAPI.getDataById(element.schedule_id, token);
  //       if (userResponse.statusCode == 200) {
  //         var user = jsonDecode(userResponse.body) as Map<String, dynamic>;
  //         element.userScheduleStart =
  //             user["data"][0]["attributes"]["start"].toString();
  //         element.userScheduleEnd =
  //             user["data"][0]["attributes"]["end"].toString();
  //       }
  //     }
  //   }
  // }

  // Future getVaccineIdentity() async {
  //   if (_userVaccine.isNotEmpty) {
  //     for (var element in _userVaccine) {
  //       Response userResponse =
  //           await VaccineAPI.getDataById(element.vaccine_id, token);
  //       if (userResponse.statusCode == 200) {
  //         var user = jsonDecode(userResponse.body) as Map<String, dynamic>;
  //         element.userVaccineName =
  //             user["data"][0]["attributes"]["name"].toString();
  //       }
  //     }
  //   }
  // }

  // Future getDetailPass(id) async {
  //   _bookingSelect = userVaccine.firstWhere((element) => element.id == id);
  //   print(bookingSelect);
  // }
}
