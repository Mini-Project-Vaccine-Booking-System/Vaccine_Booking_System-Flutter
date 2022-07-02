import 'package:flutter/material.dart';

import '../../constants.dart';
import 'components/body.dart';

class FillDataScreen extends StatelessWidget {
  const FillDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: TopBar(context, size, "Data Profil"),
      // appBar: AppBar(
      //   shape: const Border(bottom: BorderSide(color: cNeutral2, width: 1)),
      //   leadingWidth: 50,
      //   leading: IconButton(
      //       padding: const EdgeInsets.all(0.0),
      //       onPressed: () {
      //         Navigator.pop(context);
      //       },
      //       icon: const Icon(
      //         Icons.arrow_back_rounded,
      //         size: 24,
      //         color: cMainWhite,
      //       )),
      //   backgroundColor: cPrimary1,
      //   elevation: 0,
      //   title: const Text(
      //     "Lengkapi Data Anda",
      //     style: TextStyle(
      //         color: cMainWhite, fontSize: 17, fontWeight: FontWeight.bold),
      //   ),
      //   centerTitle: false,
      // ),
      body: Body(),
    );
  }
}
