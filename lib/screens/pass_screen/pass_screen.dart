import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'components/body.dart';
import '../../../bindings/package_binding.dart';
import '../../../bindings/view_model_binding.dart';
import '../../../bindings/component_binding.dart';
import '../../constants.dart';
import '../home_screen/home_screen.dart';

class PassScreen extends StatefulWidget {
  const PassScreen({Key? key, this.status = false}) : super(key: key);
  final bool status;

  @override
  State<PassScreen> createState() => _PassScreenState();
}

class _PassScreenState extends State<PassScreen> {
  Uint8List? bytes;
  @override
  Widget build(BuildContext context) {
    var ticket = Provider.of<TicketViewModel>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: widget.status == true ? cPrimary1 : null,
      body: Body(status: widget.status),
      bottomSheet: widget.status == false
          ? Container(
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
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.05, vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: RoundedButtonSolid(
                            size: size,
                            text: "Halaman Utama",
                            onAction: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const HomeScreen()),
                                  (route) => false);
                            }),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                          width: 55,
                          height: 55,
                          decoration: BoxDecoration(
                              color: cMainWhite,
                              border: Border.all(color: cPrimary1, width: 2),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15))),
                          child: PopupMenuButton(
                              offset: const Offset(0, -120),
                              icon: const Icon(
                                Icons.share,
                                color: cPrimary1,
                                size: 30,
                              ),
                              itemBuilder: (context) => [
                                    PopupMenuItem(
                                      child: const Text("Bagikan"),
                                      onTap: () {
                                        toImage(context, ticket).then((value) {
                                          if (bytes != null) {
                                            shareImage(bytes!,
                                                ticket.ticketSelect.namaPasien);
                                          }
                                        });
                                      },
                                    ),
                                    PopupMenuItem(
                                      child: const Text("Simpan"),
                                      onTap: () {
                                        toImage(context, ticket).then((value) {
                                          if (bytes != null) {
                                            saveImage(
                                                    bytes!,
                                                    ticket.ticketSelect
                                                        .namaPasien)
                                                .then((value) => showSuccess(
                                                    const Text(
                                                        "tiket berhasil disimpan"),
                                                    context));
                                          }
                                        });
                                      },
                                    )
                                  ]))
                    ],
                  )),
            )
          : null,
    );
  }

  buildCard(context, ticket) {
    Size size = MediaQuery.of(context).size;
    return Container(
        // margin:
        //     EdgeInsets.only(left: size.width * 0.12, right: size.width * 0.12),
        padding: EdgeInsets.symmetric(
            vertical: size.height * 0.03, horizontal: size.width * 0.1),
        width: size.width * 0.7,
        height: size.height * 0.71,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: cMainWhite,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Kode Registrasi Vaksin",
                style: paragraphBold3(cNeutral3),
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Center(
              child: BarcodeWidget(
                drawText: false,
                barcode: Barcode.code128(escapes: true),
                data: ticket.ticketSelect.namaPasien,
                width: size.width,
                height: 120,
              ),
            ),
            SizedBox(height: size.height * 0.04),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: const BoxDecoration(
                      color: cPrimary1,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Text(
                    "Detail Tiket Vaksn",
                    style: paragraphBold3(cMainWhite),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.01),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ticket.ticketSelect.namaPasien,
                  style: paragraphBold2(Colors.black),
                ),
                Text(
                  ticket.ticketSelect.nik,
                  style: paragraphMedium4(cPrimary1),
                )
              ],
            ),
            const Divider(
              thickness: 1,
              color: cNeutral2,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ticket.ticketSelect.namaRumahSakit,
                  style: paragraphBold2(Colors.black),
                ),
                Text(
                  ticket.ticketSelect.alamatRumahSakit,
                  style: paragraphMedium4(cPrimary1),
                  maxLines: 4,
                )
              ],
            ),
            const Divider(
              thickness: 1,
              color: cNeutral2,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat("EEEE, dd MMMM yyyy")
                      .format(ticket.ticketSelect.dateSession)
                      .toString(),
                  style: paragraphBold2(Colors.black),
                ),
                Text(
                  "${ticket.ticketSelect.start.substring(0, 5)} - ${ticket.ticketSelect.end.substring(0, 5)}",
                  style: paragraphMedium4(cPrimary1),
                )
              ],
            ),
            const Divider(
              thickness: 1,
              color: cNeutral2,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ticket.ticketSelect.namaVaksin,
                  style: paragraphBold2(Colors.black),
                ),
                Text(
                  "Jenis Vaksinasi",
                  style: paragraphMedium4(cPrimary1),
                )
              ],
            ),
          ],
        ));
  }

  Future toImage(context, ticket) async {
    final controller = ScreenshotController();
    final bytes = await controller.captureFromWidget(Material(
      child: buildCard(context, ticket),
    ));

    setState(() {
      this.bytes = bytes;
    });
  }

  Future shareImage(Uint8List bytes, String nama) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File('${appStorage.path}/tiket_$nama.png');
    await file.writeAsBytes(bytes);
    await Share.shareFiles([file.path]);
  }

  Future saveImage(Uint8List bytes, String nama) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File('${appStorage.path}/tiket_$nama.png');
    await file.writeAsBytes(bytes);
    await GallerySaver.saveImage(file.path);
  }
}
