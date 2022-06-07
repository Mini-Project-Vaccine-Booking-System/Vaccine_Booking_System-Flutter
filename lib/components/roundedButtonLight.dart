import 'package:flutter/material.dart';

import '../constants.dart';

class RoundedButtonLight extends StatelessWidget {
  const RoundedButtonLight({
    Key? key,
    required this.size,
    required this.text,
  }) : super(key: key);

  final Size size;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: 55,
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            primary: cMainWhite,
            side: const BorderSide(color: cPrimary1, width: 2),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 3
          ),
          child: Text(
            text,
            style: paragraphSemiBold1(cPrimary2),
          )),
    );
  }
}