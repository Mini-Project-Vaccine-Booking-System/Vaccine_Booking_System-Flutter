import 'package:flutter/material.dart';

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
          onTap: () {},
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
          onTap: () {},
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
                "Jenis Vaksin",
                style: paragraphMedium4(cMainBlack),
              )
            ],
          ),
        )
      ],
    );
  }
}