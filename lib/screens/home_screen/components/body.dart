import 'package:flutter/material.dart';
import 'package:vaccine/screens/home_screen/components/caraousel_news.dart';
import '../../../constants.dart';
import 'horizontal_list.dart';
import 'menu.dart';
import 'top_card.dart';
import 'top_name.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: size.height * 0.08),
          TopName(size: size),
          SizedBox(
            height: size.height * 0.04,
          ),
          TopCard(size: size),
          SizedBox(
            height: size.height * 0.03,
          ),
          Menu(),
          SizedBox(
            height: size.height * 0.05,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Lokasi Vaksin Terdekat",
                style: paragraphBold3(cNeutral3),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "Lihat Semua",
                  style: paragraphBold4(cPrimary2),
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          HorizontalList(size: size),
          SizedBox(
            height: size.height * 0.05,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Informasi Covid-19 Terkini",
                style: paragraphBold3(cNeutral3),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "Lihat Semua",
                  style: paragraphBold4(cPrimary2),
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          CarouselNews(size: size),
          SizedBox(
            height: size.height * 0.02,
          )
        ],
      ),
    );
  }
}
