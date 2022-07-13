import 'package:flutter/material.dart';

import '../constants.dart';

class RoundedButtonLoadingDanger extends StatelessWidget {
  const RoundedButtonLoadingDanger({Key? key, required this.size})
      : super(key: key);
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: 55,
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              primary: cFail,
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
