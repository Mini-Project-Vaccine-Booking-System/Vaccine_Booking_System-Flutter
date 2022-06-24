import 'package:flutter/material.dart';

import '../../../constants.dart';

class TopCard extends StatelessWidget {
  const TopCard(
      {Key? key, required this.size, required this.nama, required this.alamat})
      : super(key: key);

  final Size size;
  final String nama;
  final String alamat;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: cMainWhite,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
              spreadRadius: 2,
              blurRadius: 10,
              color: Colors.black.withOpacity(0.4),
              offset: Offset(0, 1)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/images/rs.png")),
                ),
              ),
              Positioned(
                  top: 2,
                  right: 2,
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                          shape: BoxShape.rectangle,
                          color: cNeutral1.withOpacity(0.6)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.check_circle_rounded,
                            color: Color(0xFF67F964),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Vaksin Tersedia",
                            style: paragraphSemiBold4(cMainWhite),
                          )
                        ],
                      ))),
            ],
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nama,
                  style: paragraphBold1(cMainBlack),
                ),
                Text(
                  alamat,
                  style: paragraphRegular3(cMainBlack),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
        ],
      ),
    );
  }
}
