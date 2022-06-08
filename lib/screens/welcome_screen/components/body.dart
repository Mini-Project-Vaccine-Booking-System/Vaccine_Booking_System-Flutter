import 'package:flutter/material.dart';
import 'package:vaccine/screens/login_screen/login_screen.dart';
import 'package:vaccine/screens/register_screen/register_screen.dart';

import '../../../components/roundedButtonLight.dart';
import '../../../components/roundedButtonSolid.dart';
import '../../../constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/welcome_image.png",
                fit: BoxFit.cover,
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.07,
          ),
          Text(
            "Selamat Datang 👋",
            style: headingSemiBold2(Colors.black),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Text(
            "Lakukan vaksin dengan mudah dan aman di lokasi terdekat",
            style: paragraphRegular2(Colors.black),
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          RoundedButtonSolid(
              size: size,
              text: "Masuk",
              onAction: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => LoginScreen()));
              }),
          SizedBox(
            height: size.height * 0.02,
          ),
          RoundedButtonLight(
              size: size,
              text: "Daftar",
              onAction: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => RegisterScreen()));
              })
        ],
      ),
    );
  }
}
