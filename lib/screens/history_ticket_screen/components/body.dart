import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vaccine/screens/history_ticket_screen/components/skeleton.dart';
import 'package:vaccine/screens/pass_screen/pass_screen.dart';
import 'package:vaccine/view_model/ticket_view_model.dart';

import '../../../constants.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool? isInit = false;

  // @override
  // void didChangeDependencies() async {
  //   if (isInit == null) {
  //     await Provider.of<TicketViewModel>(context, listen: false)
  //         .initialData()
  //         .then((value) {
  //       setState(() {
  //         isInit = false;
  //       });
  //     });
  //   }
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var ticket = Provider.of<TicketViewModel>(context);
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isInit == false) ...[
            SizedBox(
              height: size.height * 0.02,
            ),
            Text(
              "Hasil tiket vaksin yang sudah terdaftar",
              style: paragraphSemiBold3(cNeutral1),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(vertical: size.height * 0.03),
              itemCount: ticket.dataTicket.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    ticket.setTikectSelect = ticket.dataTicket[index];
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const PassScreen(
                                  status: true,
                                )));
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: size.width * 0.06),
                    width: size.width,
                    decoration: BoxDecoration(
                      color: cMainWhite,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.6),
                            offset: Offset(0, 5)),
                      ],
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.1),
                          child: Center(
                            child: BarcodeWidget(
                              drawText: false,
                              barcode: Barcode.code128(escapes: true),
                              data: "24151646416545614",
                              width: size.width,
                              height: 70,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.1,
                              vertical: size.height * 0.02),
                          width: size.width,
                          decoration: const BoxDecoration(
                            color: cPrimary1,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ConstrainedBox(
                                      constraints: BoxConstraints(
                                          maxWidth: size.width * 0.25),
                                      child: Text(
                                        ticket.dataTicket[index].namaPasien,
                                        style: paragraphSemiBold2(cMainWhite),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      )),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  Text(
                                    ticket.dataTicket[index].nik,
                                    style: paragraphMedium4(cMainWhite),
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    DateFormat("EEE, dd/MM/yyyy")
                                        .format(ticket
                                            .dataTicket[index].dateSession)
                                        .toString(),
                                    style: paragraphSemiBold2(cMainWhite),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  Text(
                                    "${ticket.dataTicket[index].start.substring(0, 5)} - ${ticket.dataTicket[index].end.substring(0, 5)}",
                                    style: paragraphMedium4(cMainWhite),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ] else ...[
            SizedBox(height: size.height * 0.06),
            Shimmer.fromColors(
              baseColor: Colors.grey[500]!,
              highlightColor: Colors.grey[300]!,
              child: Container(
                width: size.width,
                height: size.height * 0.2,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.015),
            Shimmer.fromColors(
              baseColor: Colors.grey[500]!,
              highlightColor: Colors.grey[300]!,
              child: Container(
                width: size.width,
                height: size.height * 0.2,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.015),
            Shimmer.fromColors(
              baseColor: Colors.grey[500]!,
              highlightColor: Colors.grey[300]!,
              child: Container(
                width: size.width,
                height: size.height * 0.2,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
