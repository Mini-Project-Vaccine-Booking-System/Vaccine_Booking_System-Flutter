import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vaccine/components/roundedButtonLoading.dart';
import 'package:vaccine/components/roundedButtonSolid.dart';
import 'package:vaccine/screens/pass_screen/pass_screen.dart';

import '../../../constants.dart';
import '../../../view_model/ticket_view_model.dart';
import 'middle_card.dart';
import 'top_card.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isLoading = false;
  List<bool> _isOpen = [false, false];
  @override
  Widget build(BuildContext context) {
    var ticket = Provider.of<TicketViewModel>(context);
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: size.height * 0.02,
        ),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Center(
                  child: Text(
                    "Konfirmasi Pemesanan",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: cMainBlack,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration:
                        BoxDecoration(color: cPrimary1, shape: BoxShape.circle),
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        TopCard(
            size: size,
            dataHospital: ticket.hospitalSelect,
            dataVaccine: ticket.vaccineSelect,
            dataSchedule: ticket.scheduleSelect),
        SizedBox(
          height: size.height * 0.03,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: Text(
            "Detail Pasien",
            style: paragraphBold1(cMainBlack),
          ),
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        MiddleCard(size: size, dataUser: ticket.userSelect),
        SizedBox(
          height: size.height * 0.03,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: Text(
            "Informasi Syarat dan Ketentuan Vaksin",
            style: paragraphBold1(cMainBlack),
          ),
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          width: size.width,
          decoration: BoxDecoration(
            border: Border.all(color: cNeutral2, width: 2),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  spreadRadius: 2,
                  blurRadius: 5,
                  color: Colors.black.withOpacity(0.2),
                  offset: Offset(0, 1)),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: ExpansionPanelList(
                elevation: 0,
                expandedHeaderPadding: EdgeInsets.zero,
                expansionCallback: (i, isOpen) =>
                    setState(() => _isOpen[i] = !isOpen),
                children: [
                  ExpansionPanel(
                    canTapOnHeader: true,
                    isExpanded: _isOpen[0],
                    headerBuilder: (context, isExpanded) => ListTile(
                      title: Text(
                        "Syarat Vaksin",
                        style: TextStyle(
                          color: cPrimary1,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    body: Padding(
                      padding:
                          const EdgeInsets.only(left: 5, right: 5, bottom: 5),
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: size.width * 0.1,
                              height: 20,
                              child: Center(
                                child: CircleAvatar(
                                  radius: 3,
                                  backgroundColor: cMainBlack,
                                ),
                              ),
                            ),
                            ConstrainedBox(
                              constraints:
                                  BoxConstraints(maxWidth: size.width * 0.75),
                              child: Text(
                                "Membawa kartu identitas (KTP, KK, SIM atau yang lainnya)",
                                style: paragraphRegular3(cMainBlack),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: size.width * 0.1,
                              height: 20,
                              child: Center(
                                child: CircleAvatar(
                                  radius: 3,
                                  backgroundColor: cMainBlack,
                                ),
                              ),
                            ),
                            ConstrainedBox(
                              constraints:
                                  BoxConstraints(maxWidth: size.width * 0.75),
                              child: Text(
                                "Memakai masker",
                                style: paragraphRegular3(cMainBlack),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: size.width * 0.1,
                              height: 20,
                              child: Center(
                                child: CircleAvatar(
                                  radius: 3,
                                  backgroundColor: cMainBlack,
                                ),
                              ),
                            ),
                            ConstrainedBox(
                              constraints:
                                  BoxConstraints(maxWidth: size.width * 0.75),
                              child: Text(
                                "Lolos pemeriksaan fisik di lokasi vaksinasi",
                                style: paragraphRegular3(cMainBlack),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        )
                      ]),
                    ),
                  ),
                  ExpansionPanel(
                    canTapOnHeader: true,
                    isExpanded: _isOpen[1],
                    headerBuilder: (context, isExpanded) => ListTile(
                      title: Text(
                        "Ketentuan Fasilitas Kesehatan",
                        style: TextStyle(
                          color: cPrimary1,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    body: Padding(
                      padding:
                          const EdgeInsets.only(left: 5, right: 5, bottom: 5),
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: size.width * 0.1,
                              height: 20,
                              child: Center(
                                child: CircleAvatar(
                                  radius: 3,
                                  backgroundColor: cMainBlack,
                                ),
                              ),
                            ),
                            ConstrainedBox(
                              constraints:
                                  BoxConstraints(maxWidth: size.width * 0.75),
                              child: Text(
                                "Tidak perlu janji temu, cukup booking jadwal vaksinasi melalui aplikasi",
                                style: paragraphRegular3(cMainBlack),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ]),
                    ),
                  )
                ]),
          ),
        ),
        SizedBox(
          height: size.height * 0.05,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: isLoading == false
              ? RoundedButtonSolid(
                  size: size,
                  text: "Konfirmasi",
                  onAction: () {
                    setState(() {
                      isLoading = !isLoading;
                    });
                    ticket
                        .saveTicket(
                            family_id: ticket.userSelect!.id,
                            vaccine_id: ticket.vaccineSelect!.id,
                            shcedule_id: ticket.scheduleSelect!.id,
                            hospital_id: ticket.hospitalSelect!.id)
                        .then((value) {
                      setState(() {
                        isLoading = !isLoading;
                      });

                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => PassScreen()),
                          (route) => false);
                    });
                  })
              : RoundedButtonLoading(size: size),
        ),
        SizedBox(
          height: size.height * 0.03,
        )
      ]),
    );
  }
}
