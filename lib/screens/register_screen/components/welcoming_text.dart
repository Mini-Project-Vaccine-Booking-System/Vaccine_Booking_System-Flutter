import 'package:flutter/material.dart';

import '../../../constants.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({Key? key, required this.size}) : super(key: key);
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/images/background.png"),
        Positioned(
            top: size.height * 0.3,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: Text(
                "Daftar Akun",
                style: headingBold1(cMainWhite),
              ),
            ))
      ],
    );
  }
}
