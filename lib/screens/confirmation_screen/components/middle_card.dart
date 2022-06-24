import 'package:flutter/material.dart';

import '../../../models/family.dart';

class MiddleCard extends StatelessWidget {
  const MiddleCard({Key? key, required this.size, required this.dataUser})
      : super(key: key);

  final Size size;
  final Family? dataUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.05, vertical: size.width * 0.05),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
              spreadRadius: 2,
              blurRadius: 5,
              color: Colors.black.withOpacity(0.2),
              offset: Offset(0, 1)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dataUser!.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Divider(
            thickness: 2,
          ),
          SizedBox(height: size.height * 0.01),
          Text(
            "NIK : ${dataUser!.nik}",
          ),
        ],
      ),
    );
  }
}
