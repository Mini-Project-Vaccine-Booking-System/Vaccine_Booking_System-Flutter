import 'package:flutter/material.dart';

import '../../constants.dart';

class HistoryTicketScreen extends StatelessWidget {
  const HistoryTicketScreen({Key? key}) : super(key: key);

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
        title: const Text(
          "Tiket Vaksin",
          style: TextStyle(
              color: cMainWhite, fontSize: 17, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
    );
  }
}
