import 'dart:convert';
import 'package:flutter/material.dart';
import '../bindings/model_binding.dart';
import '../bindings/api_binding.dart';
import '../bindings/package_binding.dart';

enum TicketViewState { none, loading, error }

class TicketViewModel extends ChangeNotifier {
  TicketViewState _state = TicketViewState.none;
  TicketViewState get state => _state;

  changeState(TicketViewState state) {
    _state = state;
    notifyListeners();
  }

  int? userId;
  late Ticket _ticketSelect;
  String? token;

  void updateData(uid, tokenData) {
    token = tokenData;
    userId = uid;
    notifyListeners();
  }

  set setTikectSelect(Ticket data) {
    _ticketSelect = data;
  }

  Ticket get ticketSelect => _ticketSelect;

  List<Ticket> _dataTicket = [];
  List<Ticket> get dataTicket => _dataTicket;

  Future saveTicket(Ticket data) async {
    _ticketSelect = data;
    _dataTicket.add(data);
    Response response = await TicketAPI.addData(data.toJson(), token);
    if (response.statusCode == 200) {
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  Future initialData() async {
    _dataTicket = [];
    changeState(TicketViewState.loading);

    try {
      Response response = await TicketAPI.getAllTicket(userId);
      print("Tiket $response");
      if (response.statusCode == 200) {
        var data = response.data as Map<String, dynamic>;
        if (data["data"].isNotEmpty) {
          for (var element in data["data"]) {
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
                dateSession:
                    DateTime.parse(element["session"]["date"].toString()),
                start: element["session"]["start"].toString(),
                end: element["session"]["end"].toString(),
                namaVaksin: element["session"]["vaksin"]["nama"].toString());

            _dataTicket.add(ticket);
            notifyListeners();
          }
        }
      }
      changeState(TicketViewState.none);
    } catch (e) {
      changeState(TicketViewState.error);
    }
  }
}
