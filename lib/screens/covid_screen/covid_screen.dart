import 'package:flutter/material.dart';
import '../../constants.dart';
import 'components/body.dart';

class CovidScreen extends StatelessWidget {
  const CovidScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: TopBar(context, size, "Informasi Covid"),
      body: const Body(),
    );
  }
}
