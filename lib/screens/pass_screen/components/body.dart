import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import '../../../bindings/package_binding.dart';
import '../../../bindings/view_model_binding.dart';
import '../../../constants.dart';

class Body extends StatefulWidget {
  const Body({Key? key, required this.status}) : super(key: key);
  final bool status;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Uint8List? bytes;
  @override
  Widget build(BuildContext context) {
    var ticket = Provider.of<TicketViewModel>(context);
    Size size = MediaQuery.of(context).size;
    return widget.status == false
        ? Stack(
            children: [
              Container(
                width: size.width,
                height: size.height * 0.5,
                color: cPrimary1,
              ),
              SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(top: size.height * 0.05),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          "Pendaftaran Berhasil",
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ),
                      SizedBox(height: size.height * 0.04),
                      Center(
                        child: Container(
                            margin: EdgeInsets.only(
                                left: size.width * 0.12,
                                right: size.width * 0.12),
                            padding: EdgeInsets.symmetric(
                                vertical: size.height * 0.03,
                                horizontal: size.width * 0.1),
                            width: size.width * 0.7,
                            height: size.height * 0.71,
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              color: cMainWhite,
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 1,
                                    blurRadius: 10,
                                    color: Colors.black.withOpacity(0.2),
                                    offset: const Offset(0.0, 0.95)),
                              ],
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
                                    data: "24151646416545614",
                                    width: size.width,
                                    height: 120,
                                  ),
                                ),
                                SizedBox(height: size.height * 0.04),
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      decoration: const BoxDecoration(
                                          color: cPrimary1,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
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
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
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
                                      DateFormat("E, dd-MM-yyyy")
                                          .format(
                                              ticket.ticketSelect.dateSession)
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
                            )),
                      ),
                      // SizedBox(height: size.height * 0.07),
                      // BottomButton(size: size),
                      // SizedBox(height: size.height * 0.03),
                    ],
                  ),
                ),
              ),
            ],
          )
        : SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.02,
                ),
                SafeArea(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Center(
                          child: Text(
                            "Detail Tiket",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600)),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: const BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            child: const Icon(
                              Icons.arrow_back_ios_rounded,
                              color: cPrimary1,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          child: RotationTransition(
                            turns: const AlwaysStoppedAnimation(320 / 360),
                            child: PopupMenuButton(
                                icon: const Icon(
                                  Icons.send,
                                  color: cMainWhite,
                                ),
                                itemBuilder: (context) => [
                                      PopupMenuItem(
                                        child: const Text("Bagikan"),
                                        onTap: () {
                                          toImage(context, ticket)
                                              .then((value) {
                                            if (bytes != null) {
                                              shareImage(
                                                  bytes!,
                                                  ticket
                                                      .ticketSelect.namaPasien);
                                            }
                                          });
                                        },
                                      ),
                                      PopupMenuItem(
                                        child: const Text("Simpan"),
                                        onTap: () {
                                          toImage(context, ticket)
                                              .then((value) {
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
                                    ]),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.05),
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                            margin: EdgeInsets.only(
                                left: size.width * 0.12,
                                right: size.width * 0.12),
                            padding: EdgeInsets.symmetric(
                                vertical: size.height * 0.03,
                                horizontal: size.width * 0.1),
                            width: size.width * 0.7,
                            height: size.height * 0.71,
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              color: cMainWhite,
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 1,
                                    blurRadius: 10,
                                    color: Colors.black.withOpacity(0.2),
                                    offset: const Offset(0.0, 0.95)),
                              ],
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
                                    data: "24151646416545614",
                                    width: size.width,
                                    height: 120,
                                  ),
                                ),
                                SizedBox(height: size.height * 0.04),
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      decoration: const BoxDecoration(
                                          color: cPrimary1,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
                                      child: Text(
                                        "Detail Tiket Vaksin",
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
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
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
                                      DateFormat("E, dd-MM-yyyy")
                                          .format(
                                              ticket.ticketSelect.dateSession)
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
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
    await OpenFile.open(file.path);
  }
}
