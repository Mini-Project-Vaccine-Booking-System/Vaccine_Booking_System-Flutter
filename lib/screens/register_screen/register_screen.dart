import 'package:flutter/material.dart';
import 'package:vaccine/constants.dart';

import 'components/body.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: TopBar(context, size, "Daftar"),
      body: Body(),
    );
  }
}
