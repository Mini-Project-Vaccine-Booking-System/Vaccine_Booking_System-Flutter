import 'package:flutter/material.dart';

import '../../../constants.dart';

class TopCard extends StatelessWidget {
  const TopCard({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
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
                      "Jerome Bell",
                      style: paragraphBold1(Colors.white),
                    ),
                    SizedBox(
                      height: size.height * 0.002,
                    ),
                    Text(
                      "3578094008020003",
                      style: paragraphRegular3(cMainWhite),
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add_box_rounded,
                      color: cMainWhite,
                      size: 28,
                    ))
              ],
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                "Lihat Riwayat Vaksin",
                style: paragraphMedium4(cMainWhite),
              ),
            )
          ],
        ),
      ),
    );
  }
}
