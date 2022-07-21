import 'package:flutter/material.dart';
import 'components/body.dart';
import '../../constants.dart';

class DaftarVaksinScreen extends StatelessWidget {
  const DaftarVaksinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: TopBar(context, size, "Daftar Vaksin"),
      body: const Body(),
    );
  }
}
