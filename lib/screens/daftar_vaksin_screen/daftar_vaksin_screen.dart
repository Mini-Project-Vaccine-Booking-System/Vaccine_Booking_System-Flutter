import 'package:flutter/material.dart';
import 'package:vaccine/screens/daftar_vaksin_screen/components/body.dart';

import '../../constants.dart';

class DaftarVaksinScreen extends StatelessWidget {
  const DaftarVaksinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: Border(bottom: BorderSide(color: cNeutral2, width: 1)),
        leadingWidth: 50,
        leading: IconButton(
            padding: EdgeInsets.all(0.0),
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back_rounded,
              size: 24,
              color: Colors.black,
            )),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          "Daftar Vaksin",
          style: TextStyle(
              color: Colors.black, fontSize: 17, fontWeight: FontWeight.w500),
        ),
        centerTitle: false,
      ),
      body: Body(),
    );
  }
}
