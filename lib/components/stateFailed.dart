import 'package:flutter/material.dart';
import 'package:vaccine/bindings/package_binding.dart';
import '../constants.dart';
import 'roundedButtonSolid.dart';

class StateFailed extends StatelessWidget {
  const StateFailed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: size.height * 0.05,
        ),
        Center(child: SvgPicture.asset("assets/svg/error.svg")),
        Center(
          child: Text(
            "Mendapatkan Data Gagal!",
            style: headingBold2(cMainBlack),
            textAlign: TextAlign.center,
          ),
        ),
        Center(
          child: Text(
            "Silahkan hubungi pengembang untuk pengecekan lebih lanjut.",
            style: paragraphSemiBold2(cNeutral1),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        RoundedButtonSolid(
            size: size,
            text: "Kembali",
            onAction: () {
              Navigator.pop(context);
            })
      ],
    );
  }
}
