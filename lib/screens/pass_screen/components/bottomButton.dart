import 'package:flutter/material.dart';
import 'package:vaccine/screens/home_screen/home_screen.dart';

import '../../../constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => HomeScreen()),
                    (route) => false);
              },
              style: ElevatedButton.styleFrom(
                  primary: cPrimary1,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  elevation: 3,
                  fixedSize: Size(250, 60)),
              child: Text(
                "Halaman Utama",
                style: paragraphSemiBold1(cMainWhite),
              )),
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                color: cMainWhite,
                border: Border.all(color: cPrimary1, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Icon(
              Icons.share,
              color: cPrimary1,
              size: 30,
            ),
          )
        ],
      ),
    );
  }
}
