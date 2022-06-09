import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'bottomButton.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: size.width,
          height: size.height * 0.5,
          color: cPrimary1,
        ),
        Container(
          margin: EdgeInsets.only(top: size.height * 0.05),
          child: Column(
            children: [
              Center(
                child: Container(
                    margin: EdgeInsets.only(
                        left: size.width * 0.12, right: size.width * 0.12),
                    padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.03,
                        horizontal: size.width * 0.1),
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
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  color: cPrimary1,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
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
                        Divider(
                          thickness: 1,
                          color: cNeutral2,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Sinovac COVID-19",
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
              SizedBox(height: size.height * 0.07),
              BottomButton(size: size)
            ],
          ),
        ),
      ],
    );
  }
}


