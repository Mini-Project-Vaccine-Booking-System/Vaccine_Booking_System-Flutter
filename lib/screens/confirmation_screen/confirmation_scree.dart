import 'package:flutter/material.dart';
import '../../../bindings/package_binding.dart';
import '../../../bindings/model_binding.dart';
import '../../../bindings/component_binding.dart';
import '../../../bindings/view_model_binding.dart';
import '../../constants.dart';
import '../pass_screen/pass_screen.dart';
import 'components/body.dart';
import 'components/confirmation.dart';

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
      body: const Body(),
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
                offset: const Offset(0, 1)),
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
                    builder: (context) {
                      bool isLoading = false;
                      return StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) =>
                            (AlertDialog(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          content: Confirmation(size: size),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  "Kembali",
                                  style: TextStyle(color: cFail2),
                                )),
                            TextButton(
                                onPressed: () async {
                                  if (family.dataSelect != null) {
                                    setState(() {
                                      isLoading = !isLoading;
                                    });

                                    ticket
                                        .saveTicket(Ticket(
                                            idBooking: 0,
                                            idKelompok: family.dataSelect!.id,
                                            idRumahSakit: 0,
                                            idSession: hospital.dataSelect.id,
                                            namaRumahSakit:
                                                hospital.dataSelect.name,
                                            alamatRumahSakit:
                                                hospital.dataSelect.address,
                                            kotaRumahSakit: "",
                                            nik: family.dataSelect!.nik,
                                            namaPasien: family.dataSelect!.name,
                                            dateSession:
                                                hospital.dataSelect.date,
                                            start: hospital.dataSelect.start,
                                            end: hospital.dataSelect.end,
                                            namaVaksin:
                                                hospital.dataSelect.vaccine))
                                        .then((value) {
                                      if (value == true) {
                                        setState(() {
                                          isLoading = !isLoading;
                                        });
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    const PassScreen()),
                                            (route) => false);

                                        showSuccess(
                                            const Text("Pemesanan berhasil!"),
                                            context);
                                      } else {
                                        setState(() {
                                          isLoading = !isLoading;
                                        });

                                        Navigator.pop(context);

                                        showError(
                                            const Text(
                                                "Pemesanan hanya bisa dilakukan satu kali oleh user yang sama!"),
                                            context);
                                      }
                                    });
                                  }
                                },
                                child: isLoading == true
                                    ? const SizedBox(
                                        width: 11,
                                        height: 11,
                                        child: CircularProgressIndicator(
                                          color: cPrimary2,
                                        ),
                                      )
                                    : Text(
                                        "Konfirmasi",
                                        style: TextStyle(
                                            color: family.dataSelect != null
                                                ? cPrimary1
                                                : cNeutral3),
                                      ))
                          ],
                        )),
                      );
                    });
              }),
        ),
      ),
    );
  }
}
