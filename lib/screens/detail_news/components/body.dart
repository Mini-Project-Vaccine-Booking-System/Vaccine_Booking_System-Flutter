import 'package:flutter/material.dart';

import '../../../constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.03, vertical: size.height * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: size.height * 0.01),
              height: 160,
              width: size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/news.jpg"),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
            Text(
              "Diterbitkan oleh detik.com, 31/05/2022 12:00",
              style: paragraphSemiBold4(cNeutral3),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Text(
              "Kasus DBD di Batang Meningkat, 3 Orang Meninggal Dunia - Ayo Semarang - ayosemarang.com",
              style: paragraphSemiBold0(Colors.black),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Text(
              "BATANG, AYOSEMARANG.COM -Kasus Demam Berdarah Dengue (DBD) di Kabupaten Batangmeningkat.\r\nDari catatan Dinas Kesehatan Batang mencatat pada bulan Mei hingga awal Juni tren peningkatan mencapai 80 kas… [+1055 chars]",
              style: paragraphMedium2(cMainBlack),
            )
          ],
        ));
  }
}
