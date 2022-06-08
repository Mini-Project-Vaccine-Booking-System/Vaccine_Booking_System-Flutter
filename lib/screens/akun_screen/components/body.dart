import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'data_akun.dart';
import 'top_photo.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.05,
          ),
          TopPhoto(),
          SizedBox(
            height: size.height * 0.03,
          ),
          Text(
            "Jerome Bell",
            style: headingSemiBold2(Colors.black),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          DataAkun(
            size: size,
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                  color: cPrimary1,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 2,
                        blurRadius: 10,
                        color: Colors.black.withOpacity(0.4),
                        offset: Offset(0, 1)),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.logout,
                      color: cMainWhite,
                      size: 24,
                    ),
                    Text(
                      "Keluar",
                      style: paragraphSemiBold1(cMainWhite),
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
        ],
      ),
    );
  }
}
