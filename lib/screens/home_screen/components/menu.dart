import 'package:flutter/material.dart';
import 'package:vaccine/screens/daftar_vaksin_screen/daftar_vaksin_screen.dart';
import 'package:vaccine/screens/history_ticket_screen/history_ticket_screen.dart';

import '../../../constants.dart';

class Menu extends StatelessWidget {
  const Menu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => DaftarVaksinScreen()));
          },
          child: Column(
            children: [
              Image.asset("assets/icons/left.png"),
              Text(
                "Daftar Vaksin",
                style: paragraphMedium4(cMainBlack),
              )
            ],
          ),
        ),
        GestureDetector(
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
        ),
        GestureDetector(
          onTap: () {},
          child: Column(
            children: [
              Image.asset("assets/icons/right.png"),
              Text(
                "Informasi Covid",
                style: paragraphMedium4(cMainBlack),
              )
            ],
          ),
        )
      ],
    );
  }
}
