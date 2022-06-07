import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vaccine/components/roundedButtonSolid.dart';
import 'package:vaccine/components/roundedContainer.dart';
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
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset("assets/images/background.png"),
                Positioned(
                    top: size.height * 0.3,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.05),
                      child: Text(
                        "Selamat Datang",
                        style: headingBold1(cMainWhite),
                      ),
                    ))
              ],
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Email",
                    style: paragraphMedium2(cMainBlack),
                  ),
                  roundedContainer(
                    child: FormBuilderTextField(
                      name: "username",
                      decoration: InputDecoration(
                        hintText: "youareemail@gmail.com",
                        hintStyle: paragraphRegular1(cNeutral1),
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: cNeutral1,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Password",
                    style: paragraphMedium2(cMainBlack),
                  ),
                  roundedContainer(
                    child: FormBuilderTextField(
                      name: "username",
                      decoration: InputDecoration(
                        hintText: "ketik password disini",
                        hintStyle: paragraphRegular1(cNeutral1),
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.lock_outline_rounded,
                          color: cNeutral1,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.06,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: RoundedButtonSolid(size: size, text: "Masuk"),
            ),
            SizedBox(height: size.height * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Belum punya akun?",
                    style: paragraphRegular3(cMainBlack),
                  ),
                  SizedBox(
                    width: size.width * 0.01,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Daftar",
                      style: paragraphRegular3(cPrimary1),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
