import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:vaccine/screens/detail_news/detail_news.dart';

import '../../../components/glass.dart';
import '../../../constants.dart';

class CarouselNews extends StatelessWidget {
  const CarouselNews({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        options: CarouselOptions(
          height: size.height * 0.3,
          viewportFraction: 1,
          autoPlay: true,
        ),
        itemCount: 3,
        itemBuilder: (context, index, realIndex) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => DetailNews()));
            },
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/news.jpg"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Glass(
                  children: [
                    Text(
                      "Sebaran Covid Terkini",
                      style: paragraphSemiBold1(Colors.white),
                    ),
                    Text(
                      "DKI Jakarta Tertinggi, Disusul Jabar dan Jatim",
                      style: paragraphLight3(Colors.white),
                    )
                  ],
                )),
          );
        });
  }
}
