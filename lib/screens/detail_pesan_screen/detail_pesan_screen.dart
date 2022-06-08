import 'package:flutter/material.dart';
import 'package:vaccine/screens/detail_pesan_screen/components/body.dart';

import '../../constants.dart';

class DetailPesanScreen extends StatelessWidget {
  const DetailPesanScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const Border(bottom: BorderSide(color: cNeutral2, width: 1)),
        leadingWidth: 50,
        leading: IconButton(
            padding: const EdgeInsets.all(0.0),
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_rounded,
              size: 24,
              color: cMainWhite,
            )),
        backgroundColor: cPrimary1,
        elevation: 0.0,
        title: const Text(
          "Detail",
          style: TextStyle(
              color: cMainWhite, fontSize: 17, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: Body(),
    );
  }
}