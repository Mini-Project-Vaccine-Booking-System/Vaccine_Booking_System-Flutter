import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaccine/models/ticket.dart';
import 'package:vaccine/screens/confirmation_screen/components/body.dart';

import '../../components/roundedButtonLoading.dart';
import '../../components/roundedButtonSolid.dart';
import '../../constants.dart';
import '../../view_model/family_view_model.dart';
import '../../view_model/hospital_view_model.dart';
import '../../view_model/ticket_view_model.dart';
import '../pass_screen/pass_screen.dart';

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var hospital = Provider.of<HospitalViewModel>(context);
    var ticket = Provider.of<TicketViewModel>(context);
    var family = Provider.of<FamilyViewModel>(context);
    return Scaffold(
      appBar: TopBar(context, size, "Detail"),
      /*   appBar: AppBar(
        shape: const Border(bottom: BorderSide(color: cNeutral2, width: 1)),
        leadingWidth: 50,
        leading: IconButton(
            padding: const EdgeInsets.all(0.0),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_rounded,
              size: 24,
              color: cMainWhite,
            )),
        backgroundColor: cPrimary1,
        elevation: 0.0,
        title: const Text(
          "Konfirmasi Pesanan",
          style: TextStyle(
              color: cMainWhite, fontSize: 17, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ), */
      body: Body(),
      bottomSheet: Container(
        width: size.width,
        height: 70,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
                spreadRadius: 2,
                blurRadius: 2,
                color: Colors.black.withOpacity(0.2),
                offset: Offset(0, 1)),
          ],
        ),
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: 10),
          child: RoundedButtonSolid(
              size: size,
              text: "Pesan Sekarang",
              onAction: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: const Text("Konfirmasi"),
                          content: const Text(
                              "Apakah anda yakin data sudah benar ?"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Batal")),
                            TextButton(
                                onPressed: () async {
                                  if (hospital.dataSelect != null &&
                                      family.dataSelect != null) {
                                    ticket
                                        .saveTicket(Ticket(
                                            idBooking: 0,
                                            idKelompok: family.dataSelect.id,
                                            idRumahSakit: 0,
                                            idSession: hospital.dataSelect.id,
                                            namaRumahSakit:
                                                hospital.dataSelect.name,
                                            alamatRumahSakit:
                                                hospital.dataSelect.address,
                                            kotaRumahSakit: "",
                                            nik: family.dataSelect.nik,
                                            namaPasien: family.dataSelect.name,
                                            dateSession:
                                                hospital.dataSelect.date,
                                            start: hospital.dataSelect.start,
                                            end: hospital.dataSelect.end,
                                            namaVaksin:
                                                hospital.dataSelect.vaccine))
                                        .then((value) {
                                      if (value == true) {
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) => PassScreen()),
                                            (route) => false);
                                      }
                                    });
                                  }
                                },
                                child: const Text("Yakin"))
                          ],
                        ));
                // ticket
                //     .saveTicket(
                //         family_id: ticket.userSelect!.id,
                //         vaccine_id: ticket.vaccineSelect!.id,
                //         shcedule_id: ticket.scheduleSelect!.id,
                //         hospital_id: ticket.hospitalSelect!.id)
                //     .then((value) {
                //   Navigator.pushAndRemoveUntil(
                //       context,
                //       MaterialPageRoute(builder: (_) => PassScreen()),
                //       (route) => false);
                // });
              }),
        ),
      ),
    );
  }
}
