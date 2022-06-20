import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaccine/screens/anggota_screen/anggota_screen.dart';

import '../../../constants.dart';
import '../../../view_model/account_view_model.dart';

class TopCard extends StatelessWidget {
  const TopCard({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    final account = Provider.of<AccoutnViewModel>(context);
    return Container(
      width: size.width,
      height: 104,
      decoration: const BoxDecoration(
          color: cPrimaryG2,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xFF238DFF),
                // Color(0xFF66A7FF),
                Color(0xFF86B9FF),
                // Color(0xFFAED0FF)
              ])),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.08, vertical: size.height * 0.02),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      account.data != null
                          ? account.data!.name
                          : "Nama belum diisi",
                      style: paragraphBold1(Colors.white),
                    ),
                    SizedBox(
                      height: size.height * 0.002,
                    ),
                    Text(account.data != null
                          ? account.data!.nik
                          : "",
                      style: paragraphRegular3(cMainWhite),
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => AnggotaScreen()));
                    },
                    icon: Icon(
                      Icons.add_box_rounded,
                      color: cMainWhite,
                      size: 28,
                    ))
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.notifications,
                  color: cMainWhite,
                ),
                SizedBox(width: size.width * 0.01),
                Text(
                  "Pastikan data sudah lengkap",
                  style: paragraphMedium4(cMainWhite),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
