import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vaccine/components/roundedButtonSolid.dart';

import 'components/roundedContainer.dart';
import 'constants.dart';

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
      appBar: AppBar(
        shape: const Border(bottom: BorderSide(color: cNeutral2, width: 1)),
        leadingWidth: 50,
        leading: IconButton(
            padding: const EdgeInsets.all(0.0),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_rounded,
              size: 24,
              color: cMainWhite,
            )),
        backgroundColor: cPrimary1,
        title: const Text(
          "Edit Anggota",
          style: TextStyle(
              color: cMainWhite, fontSize: 17, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.03,
            ),
            Text(
              "Nama Lengkap",
              style: paragraphMedium2(cMainBlack),
            ),
            roundedContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: FormBuilderTextField(
                  name: "username",
                  decoration: InputDecoration(
                    hintText: "ketik nama lengkap disini",
                    hintStyle: paragraphRegular1(cNeutral1),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Text(
              "NIK",
              style: paragraphMedium2(cMainBlack),
            ),
            roundedContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: FormBuilderTextField(
                  name: "nik",
                  decoration: InputDecoration(
                    hintText: "ketik nama lengkap disini",
                    hintStyle: paragraphRegular1(cNeutral1),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Text(
              "Usia",
              style: paragraphMedium2(cMainBlack),
            ),
            roundedContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: FormBuilderTextField(
                  name: "usia",
                  decoration: InputDecoration(
                    hintText: "ketika usia disini",
                    hintStyle: paragraphRegular1(cNeutral1),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Text(
              "No. Handphone",
              style: paragraphMedium2(cMainBlack),
            ),
            roundedContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: FormBuilderTextField(
                  name: "phone",
                  decoration: InputDecoration(
                    hintText: "ketik no handphone disini",
                    hintStyle: paragraphRegular1(cNeutral1),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Text(
              "Jenis Kelamin",
              style: paragraphMedium2(cMainBlack),
            ),
            roundedContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: FormBuilderTextField(
                  name: "gender",
                  decoration: InputDecoration(
                    hintText: "ketik jenis kelamin disini",
                    hintStyle: paragraphRegular1(cNeutral1),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            RoundedButtonSolid(size: size, text: "Simpan", onAction: () {}),
            SizedBox(
              height: size.height * 0.01,
            ),
            Center(
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Hapus",
                      style: paragraphSemiBold1(cFail2),
                    )))
          ],
        ),
      ),
    );
  }
}
