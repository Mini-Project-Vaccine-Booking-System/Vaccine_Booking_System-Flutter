import 'package:flutter/material.dart';

import '../constants.dart';

class roundedContainer extends StatelessWidget {
  const roundedContainer({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.only(top: size.width * 0.02),
        padding:
            EdgeInsets.symmetric(horizontal: size.width * 0.02),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: cNeutral1, width: 2)),
        child: child);
  }
}
