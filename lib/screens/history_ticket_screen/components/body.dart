import 'package:flutter/material.dart';
import '../../../bindings/package_binding.dart';
import '../../../bindings/view_model_binding.dart';
import '../../../bindings/component_binding.dart';
import '../../../screens/pass_screen/pass_screen.dart';
import '../../../constants.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var ticket = Provider.of<TicketViewModel>(context);
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: ticket.dataTicket.isEmpty
          ? const StateNull(
              text:
                  "Data riwayat anda masih kosong, silahkan lakukan reservasi vaksin.")
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                          borderRadius: const BorderRadius.all(Radius.circular(15)),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.6),
                                offset: const Offset(0, 5)),
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ConstrainedBox(
                                          constraints: BoxConstraints(
                                              maxWidth: size.width * 0.25),
                                          child: Text(
                                            ticket.dataTicket[index].namaPasien,
                                            style:
                                                paragraphSemiBold2(cMainWhite),
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
              ],
            ),
    );
  }
}
