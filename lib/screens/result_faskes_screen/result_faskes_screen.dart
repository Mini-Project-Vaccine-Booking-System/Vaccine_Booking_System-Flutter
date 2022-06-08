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
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_rounded,
              size: 24,
              color: Colors.black,
            )),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text(
          "Fasilitas Kesehatan",
          style: TextStyle(
              color: Colors.black, fontSize: 17, fontWeight: FontWeight.w500),
        ),
        centerTitle: false,
      ),
      body: Body(),
    );
  }
}
