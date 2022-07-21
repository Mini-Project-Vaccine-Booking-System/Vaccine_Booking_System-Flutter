import 'package:flutter/material.dart';
import '../../../bindings/package_binding.dart';
import '../../anggota_screen/anggota_screen.dart';
import '../../covid_screen/covid_screen.dart';
import '../../../bindings/view_model_binding.dart';
import '../../history_ticket_screen/history_ticket_screen.dart';
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
                  context, MaterialPageRoute(builder: (_) => const AnggotaScreen()));
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
                  "Tiket",
                  style: paragraphRegular3(cMainBlack),
                )
              ],
            )
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
            ),
      ],
    );
  }
}
