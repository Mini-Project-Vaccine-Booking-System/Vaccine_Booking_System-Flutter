import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../components/roundedButtonSolid.dart';
import '../../../components/roundedContainer.dart';
import '../../../constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
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
          RoundedButtonSolid(
              size: size,
              text: "Simpan",
              onAction: () {
                Navigator.pop(context);
              }),
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
    );
  }
}
