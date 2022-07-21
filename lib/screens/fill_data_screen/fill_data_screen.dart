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
      body: const Body(),
    );
  }
}
