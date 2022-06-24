import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vaccine/view_model/ticket_view_model.dart';

import '../../../constants.dart';
import 'bottomButton.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var ticket = Provider.of<TicketViewModel>(context);
    Size size = MediaQuery.of(context).size;
    return Stack(
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
                  child: Container(
                      margin: EdgeInsets.only(
                          left: size.width * 0.12, right: size.width * 0.12),
                      padding: EdgeInsets.symmetric(
                          vertical: size.height * 0.03,
                          horizontal: size.width * 0.1),
                      width: size.width * 0.7,
                      height: size.height * 0.71,
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
                                ticket.userSelect!.name,
                                style: paragraphBold2(Colors.black),
                              ),
                              Text(
                                ticket.userSelect!.nik,
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
                                ticket.hospitalSelect!.name,
                                style: paragraphBold2(Colors.black),
                              ),
                              Text(
                                ticket.hospitalSelect!.address,
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
                                DateFormat('EEEE, d MMMM y')
                                    .format(DateTime.parse(
                                        ticket.scheduleSelect!.start))
                                    .toString(),
                                style: paragraphBold2(Colors.black),
                              ),
                              Text(
                                "${DateFormat.Hm().format(DateTime.parse(ticket.scheduleSelect!.start)).toString()} - ${DateFormat.Hm().format(DateTime.parse(ticket.scheduleSelect!.end)).toString()}",
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
                                ticket.vaccineSelect!.name,
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
                BottomButton(size: size),
                SizedBox(height: size.height * 0.03),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
