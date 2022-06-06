import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vaccine/components/roundedButtonLight.dart';
import 'package:vaccine/components/roundedButtonSolid.dart';
import 'package:vaccine/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
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
            RoundedButtonSolid(size: size, text: "Masuk"),
            SizedBox(
              height: size.height * 0.02,
            ),
            RoundedButtonLight(size: size, text: "Daftar")
          ],
        ),
      ),
    );
  }
}
