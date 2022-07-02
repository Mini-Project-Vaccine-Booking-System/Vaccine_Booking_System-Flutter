import 'package:flutter/material.dart';

import '../../../constants.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({Key? key, required this.size}) : super(key: key);
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: size.width,
          height: size.height * 0.5,
        ),
        Positioned(
            top: -size.height * 0.05,
            left: -size.width * 0.21,
            child: Image.asset(
              "assets/images/background.png",
              width: size.width,
              fit: BoxFit.fill,
            )),
        Positioned(
            top: size.height * 0.3,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: Text(
                "Register",
                style: headingBold1(cMainWhite),
              ),
            ))
      ],
    );
  }
}
