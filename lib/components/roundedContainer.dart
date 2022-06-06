import 'package:flutter/material.dart';

import '../constants.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.all(size.width * 0.05),
        padding:
            EdgeInsets.symmetric(horizontal: size.width * 0.07, vertical: 3),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: cNeutral1, width: 2)),
        child: child);
  }
}
