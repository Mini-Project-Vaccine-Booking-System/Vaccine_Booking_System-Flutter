import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants.dart';
import 'components/body.dart';

class Akun extends StatelessWidget {
  const Akun({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: TopBar(context, size, "Profil"),
      body: Body(),
    );
  }
}
