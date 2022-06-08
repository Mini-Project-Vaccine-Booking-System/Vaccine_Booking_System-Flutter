import 'package:flutter/material.dart';

import '../../constants.dart';
import 'components/body.dart';

class Akun extends StatelessWidget {
  const Akun({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
        leadingWidth: 70,
        leading: IconButton(
            padding: EdgeInsets.all(0.0),
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 30,
              color: cNeutral3,
            )),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          "Akun",
          style: headingRegular2(cMainBlack),
        ),
        centerTitle: true,
      ), body: Body(),);
  }
}