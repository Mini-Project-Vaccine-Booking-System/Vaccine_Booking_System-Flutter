import 'package:flutter/material.dart';
import 'package:vaccine/screens/pass_screen/components/body.dart';

import '../../constants.dart';

class PassScreen extends StatelessWidget {
  const PassScreen({Key? key, this.status = false}) : super(key: key);
  final bool status;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: status == true ? cPrimary1 : null,
      appBar: status == false
          ? AppBar(
              title: Text("Pendaftaran Berhasil"),
              centerTitle: true,
              backgroundColor: cPrimary1,
              elevation: 0,
              automaticallyImplyLeading: false,
            )
          : null,
      body: Body(status: status),
    );
  }
}
