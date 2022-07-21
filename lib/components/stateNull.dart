import 'package:flutter/material.dart';

import '../constants.dart';
import 'roundedButtonSolid.dart';

class StateNull extends StatelessWidget {
  const StateNull({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: size.height * 0.05,
        ),
        Center(child: Image.asset("assets/images/data.png")),
        Center(
          child: Text(
            "Data Tidak Tersedia!",
            style: headingBold2(cMainBlack),
            textAlign: TextAlign.center,
          ),
        ),
        Center(
          child: Text(
            text,
            style: paragraphSemiBold2(cNeutral1),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        RoundedButtonSolid(
            size: size,
            text: "Kembali",
            onAction: () {
              Navigator.pop(context);
            })
      ],
    );
  }
}
