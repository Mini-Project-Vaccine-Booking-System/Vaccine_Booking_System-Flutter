import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:vaccine/screens/anggota_screen/anggota_screen.dart';
import 'package:vaccine/screens/covid_screen/covid_screen.dart';
import 'package:vaccine/screens/daftar_vaksin_screen/daftar_vaksin_screen.dart';
import 'package:vaccine/screens/history_ticket_screen/history_ticket_screen.dart';
import 'package:vaccine/view_model/ticket_view_model.dart';

import '../../../constants.dart';

class Menu extends StatelessWidget {
  const Menu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var ticket = Provider.of<TicketViewModel>(context);
    Size size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => AnggotaScreen()));
            },
            child: Column(
              children: [
                SvgPicture.asset(
                  "assets/svg/add.svg",
                  width: 80,
                  height: 80,
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Text(
                  "Anggota",
                  style: paragraphRegular3(cMainBlack),
                )
              ],
            )
            /* Column(
            children: [
              Image.asset("assets/icons/left.png"),
              Text(
                "Daftar Vaksin",
                style: paragraphMedium4(cMainBlack),
              )
            ],
          ), */
            ),
        GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const HistoryTicketScreen()));
            },
            child: Column(
              children: [
                SvgPicture.asset(
                  "assets/svg/tiket.svg",
                  width: 80,
                  height: 80,
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Text(
                  "Riwayat",
                  style: paragraphRegular3(cMainBlack),
                )
              ],
            )
            /* Column(
            children: [
              Image.asset("assets/icons/left.png"),
              Text(
                "Daftar Vaksin",
                style: paragraphMedium4(cMainBlack),
              )
            ],
          ), */
            ),
        GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const CovidScreen()));
            },
            child: Column(
              children: [
                SvgPicture.asset(
                  "assets/svg/info.svg",
                  width: 80,
                  height: 80,
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Text(
                  "Informasi",
                  style: paragraphRegular3(cMainBlack),
                )
              ],
            )
            /* Column(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 1,
                          color: Colors.black.withOpacity(0.2),
                          offset: const Offset(0, 1)),
                    ],
                  ),
                  child: Center(
                    child: Image.asset("assets/icons/informasi.png"),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Text(
                  "Informasi",
                  style: paragraphSemiBold3(cPrimary1),
                )
              ],
            ) */
            /* Column(
            children: [
              Image.asset("assets/icons/left.png"),
              Text(
                "Daftar Vaksin",
                style: paragraphMedium4(cMainBlack),
              )
            ],
          ), */
            ),
        /* GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => HistoryTicketScreen()));
          },
          child: Column(
            children: [
              Image.asset("assets/icons/center.png"),
              Text(
                "Tiket Vaksin",
                style: paragraphMedium4(cMainBlack),
              )
            ],
          ),
        ), */
        /* GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => CovidScreen()));
          },
          child: Column(
            children: [
              Image.asset("assets/icons/right.png"),
              Text(
                "Informasi Covid",
                style: paragraphMedium4(cMainBlack),
              )
            ],
          ),
        ) */
      ],
    );
  }
}
