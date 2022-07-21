import 'package:flutter/material.dart';

import '../constants.dart';

class RoundedButtonLoading extends StatelessWidget {
  const RoundedButtonLoading({Key? key, required this.size}) : super(key: key);
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: 55,
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              primary: cPrimary1,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              elevation: 3),
          child: const Center(
            child: CircularProgressIndicator(
              color: cMainWhite,
            ),
          )),
    );
  }
}
