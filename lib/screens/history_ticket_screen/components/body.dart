import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vaccine/screens/pass_screen/pass_screen.dart';
import 'package:vaccine/view_model/ticket_view_model.dart';

import '../../../constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var ticket = Provider.of<TicketViewModel>(context);
    return ListView.builder(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.05, vertical: size.height * 0.03),
      itemCount: ticket.userVaccine.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => PassScreen()));
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
                    color: Colors.black.withOpacity(0.4),
                    offset: Offset(0, 5)),
              ],
            ),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
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
                  decoration: BoxDecoration(
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
                              constraints:
                                  BoxConstraints(maxWidth: size.width * 0.25),
                              child: Text(
                                ticket.userVaccine[index].userName,
                                style: paragraphSemiBold2(cMainWhite),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              )),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Text(
                            ticket.userVaccine[index].userNik,
                            style: paragraphMedium4(cMainWhite),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            DateFormat('E, d MMMM y')
                                .format(DateTime.parse(ticket
                                    .userVaccine[index].userScheduleStart))
                                .toString(),
                            style: paragraphSemiBold2(cMainWhite),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Text(
                            "${DateFormat.Hm().format(DateTime.parse(ticket.userVaccine[index].userScheduleStart)).toString()} - ${DateFormat.Hm().format(DateTime.parse(ticket.userVaccine[index].userScheduleEnd)).toString()}",
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
    );
  }
}
