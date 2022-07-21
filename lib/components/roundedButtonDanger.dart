import 'package:flutter/material.dart';
import '../constants.dart';

class RoundedButtonDanger extends StatelessWidget {
  const RoundedButtonDanger(
      {Key? key,
      required this.size,
      required this.text,
      required this.onAction})
      : super(key: key);

  final Size size;
  final String text;
  final Function() onAction;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: 55,
      child: ElevatedButton(
          onPressed: onAction,
          style: ElevatedButton.styleFrom(
              primary: cFail,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              elevation: 3),
          child: Text(
            text,
            style: paragraphSemiBold1(cMainWhite),
          )),
    );
  }
}
