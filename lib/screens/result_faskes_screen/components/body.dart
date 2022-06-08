import 'package:flutter/material.dart';

import '../../../constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.05,
          ),
          Text(
            "Hasil pencarian berdasarkan filter",
            style: paragraphSemiBold3(cNeutral1),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          ListView.builder(
            itemCount: 6,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                height: size.height * 0.13,
                width: size.width,
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 5,
                          color: Colors.black.withOpacity(0.2),
                          offset: Offset(0, 1)),
                    ],
                    color: cMainWhite,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/rs.png")),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "RS Gotong Royong",
                          style: paragraphSemiBold1(cMainBlack),
                        ),
                        Text(
                          "Surabaya, Jawa Timur",
                          style: paragraphRegular3(cMainBlack),
                        )
                      ],
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 24,
                      color: cNeutral3,
                    )
                  ],
                ),
              );
            },
          ),
          SizedBox(
            height: size.height * 0.03,
          )
        ],
      ),
    );
  }
}
