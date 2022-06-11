import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:vaccine/screens/pass_screen/pass_screen.dart';

import '../../../constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.05, vertical: size.height * 0.03),
      itemCount: 5,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => PassScreen()));
          },
          child: Container(
            margin: EdgeInsets.only(bottom: size.width * 0.06),
            width: size.width,
            decoration: BoxDecoration(
              color: cMainWhite,
              borderRadius: BorderRadius.all(Radius.circular(15)),
              boxShadow: [
                BoxShadow(
                    spreadRadius: 2,
                    blurRadius: 10,
                    color: Colors.black.withOpacity(0.4),
                    offset: Offset(0, 5)),
              ],
            ),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                  child: Center(
                    child: BarcodeWidget(
                      drawText: false,
                      barcode: Barcode.code128(escapes: true),
                      data: "24151646416545614",
                      width: size.width,
                      height: 70,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.1,
                      vertical: size.height * 0.02),
                  width: size.width,
                  decoration: BoxDecoration(
                    color: cPrimary1,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ConstrainedBox(
                              constraints:
                                  BoxConstraints(maxWidth: size.width * 0.4),
                              child: Text(
                                "Jerome Bell",
                                style: paragraphSemiBold2(cMainWhite),
                              )),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Text(
                            "3578094008020003",
                            style: paragraphMedium4(cMainWhite),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "22 Juni 2022",
                            style: paragraphSemiBold2(cMainWhite),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Text(
                            "08.00 - 12.00",
                            style: paragraphMedium4(cMainWhite),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
