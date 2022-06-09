import 'package:flutter/material.dart';
import 'package:vaccine/screens/result_faskes_screen/components/body.dart';

import '../../constants.dart';

class ResultFaskesScreen extends StatelessWidget {
  const ResultFaskesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const Border(bottom: BorderSide(color: cNeutral2, width: 1)),
        leadingWidth: 50,
        leading: IconButton(
            padding: const EdgeInsets.all(0.0),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_rounded,
              size: 24,
              color: cMainWhite,
            )),
        backgroundColor: cPrimary1,
        elevation: 0.0,
        title: const Text(
          "Daftar Fasilitas Kesehatan",
          style: TextStyle(
              color: cMainWhite, fontSize: 17, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: Body(),
    );
  }
}
