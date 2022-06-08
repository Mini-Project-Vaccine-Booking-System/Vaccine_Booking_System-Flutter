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
          Center(child: Image.asset("assets/icons/icon.png")),
          SizedBox(
            height: size.height * 0.03,
          ),
          Text(
            "Lindungi diri dan sekitar dengan vaksinasi COVID-19",
            style: paragraphSemiBold1(cMainBlack),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Text(
            "Lakukan vaksin dengan mudah dan cepat dari lokasi terdekat",
            style: paragraphMedium3(cNeutral3),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Text(
            "Cari lokasi vaksin",
            style: paragraphMedium2(cMainBlack),
          ),
          roundedContainer(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: FormBuilderTextField(
                name: "username",
                decoration: InputDecoration(
                  hintText: "e.g Jakarta",
                  hintStyle: paragraphRegular1(cNeutral1),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          RoundedButtonSolid(size: size, text: "Cari")
        ],
      ),
    );
  }
}
