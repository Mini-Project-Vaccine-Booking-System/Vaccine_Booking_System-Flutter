import 'package:flutter/material.dart';

import '../../../components/glass.dart';
import '../../../constants.dart';
import '../../detail_news/detail_news.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.03, vertical: size.height * 0.03),
        itemCount: 5,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => DetailNews()));
            },
            child: Container(
                margin: EdgeInsets.only(bottom: size.height * 0.03),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/news.jpg"),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 2,
                        blurRadius: 10,
                        color: Colors.black.withOpacity(0.4),
                        offset: Offset(0, 5)),
                  ],
                ),
                child: Glass(
                  children: [
                    Text(
                      "Sebaran Covid Terkini Sebaran Covid Terkini",
                      style: paragraphSemiBold1(Colors.white),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "DKI Jakarta Tertinggi, Disusul Jabar dan Jatim",
                      style: paragraphLight3(Colors.white),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                )),
          );
        });
  }
}
