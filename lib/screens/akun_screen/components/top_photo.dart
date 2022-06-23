import 'package:flutter/material.dart';

import '../../../constants.dart';

class TopPhoto extends StatelessWidget {
  TopPhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 15, right: 15, left: 15),
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                    spreadRadius: 2,
                    blurRadius: 10,
                    color: Colors.black.withOpacity(0.4),
                    offset: Offset(0, 1)),
              ],
              shape: BoxShape.rectangle,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/avatar.png")),
            ),
          ),
          Positioned(
              bottom: 2,
              right: 2,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      shape: BoxShape.rectangle,
                      color: cPrimary1),
                  child: Icon(
                    Icons.camera_alt_outlined,
                    color: cMainWhite,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
