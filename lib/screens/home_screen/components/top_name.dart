import 'package:flutter/material.dart';
import 'package:vaccine/screens/akun_screen/akun_screen.dart';

import '../../../constants.dart';

class TopName extends StatelessWidget {
  const TopName({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "👋 Halo, Jerome",
              style: headingBold2(Colors.black),
            ),
            SizedBox(
              height: size.height * 0.005,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.location_on_rounded,
                  color: cPrimaryG,
                ),
                SizedBox(
                  width: size.width * 0.02,
                ),
                Text(
                  "Bandung, Jawa Barat",
                  style: paragraphMedium3(cNeutral1),
                )
              ],
            )
          ],
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => Akun()));
          },
          child: Container(
              width: 47,
              height: 47,
              decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(10)))),
        )
      ],
    );
  }
}
