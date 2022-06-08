import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vaccine/components/roundedButtonSolid.dart';

import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.5, 0.5],
          colors: [cPrimary1, Colors.white],
        )),
        padding: EdgeInsets.only(top: size.height * 0.05),
        width: size.width,
        height: size.height,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            const Text(
              "Pendaftaran Berhasil",
              style: TextStyle(
                  color: cMainWhite, fontSize: 17, fontWeight: FontWeight.bold),
            ),
            Positioned(
              top: size.height * 0.1,
              child: Container(
                margin: EdgeInsets.only(
                    left: size.width * 0.12, right: size.width * 0.12),
                padding: EdgeInsets.symmetric(
                    vertical: size.height * 0.03, horizontal: size.width * 0.1),
                width: size.width * 0.7,
                height: size.height * 0.65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: cMainWhite,
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 1,
                        blurRadius: 10,
                        color: Colors.black.withOpacity(0.2),
                        offset: Offset(0.0, 0.95)),
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
                        barcode: Barcode.qrCode(),
                        data: "Hello World",
                        width: 170,
                        height: 170,
                      ),
                    ),
                    SizedBox(height: size.height * 0.04),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: cPrimary1,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Text(
                            "Detail Registrasi",
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
                          "Jerome Bell",
                          style: paragraphBold2(Colors.black),
                        ),
                        Text(
                          "3578094008020003",
                          style: paragraphMedium4(cPrimary1),
                        )
                      ],
                    ),
                    Divider(
                      thickness: 1,
                      color: cNeutral2,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "RS Gotong Royong",
                          style: paragraphBold2(Colors.black),
                        ),
                        Text(
                          "Jl Pemuda No.100 Surabaya",
                          style: paragraphMedium4(cPrimary1),
                        )
                      ],
                    ),
                    Divider(
                      thickness: 1,
                      color: cNeutral2,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Selasa, 08 Juni 2022",
                          style: paragraphBold2(Colors.black),
                        ),
                        Text(
                          "08.00 - 12.00",
                          style: paragraphMedium4(cPrimary1),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                top: size.height * 0.3,
                left: 42,
                child: CircleAvatar(
                  backgroundColor: cPrimary1,
                  radius: 10,
                )),
            Positioned(
                top: size.height * 0.3,
                right: 42,
                child: CircleAvatar(
                  backgroundColor: cPrimary1,
                  radius: 10,
                )),
          ],
        ),
      ),
    );
  }
}
