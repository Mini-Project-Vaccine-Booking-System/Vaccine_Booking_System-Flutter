import 'package:flutter/material.dart';
import 'package:vaccine/screens/pass_screen/components/body.dart';

import '../../constants.dart';

class PassScreen extends StatelessWidget {
  const PassScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pendaftaran Berhasil"),
        centerTitle: true,
        backgroundColor: cPrimary1,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Body(),
    );
  }
}
