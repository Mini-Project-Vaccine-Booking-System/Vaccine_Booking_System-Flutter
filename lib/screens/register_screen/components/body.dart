import 'package:flutter/material.dart';

import '../../../components/roundedButtonSolid.dart';
import '../../../constants.dart';
import '../../home_screen/home_screen.dart';
import 'email_field.dart';
import 'password_field.dart';
import 'welcoming_text.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WelcomeText(size: size),
          SizedBox(
            height: size.height * 0.03,
          ),
          EmailText(size: size),
          SizedBox(
            height: size.height * 0.02,
          ),
          PasswordText(size: size),
          SizedBox(
            height: size.height * 0.06,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: RoundedButtonSolid(
                size: size,
                text: "Daftar",
                onAction: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => HomeScreen()));
                }),
          ),
          SizedBox(height: size.height * 0.02),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sudah punya akun?",
                  style: paragraphRegular3(cMainBlack),
                ),
                SizedBox(
                  width: size.width * 0.01,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Masuk",
                    style: paragraphRegular3(cPrimary1),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
