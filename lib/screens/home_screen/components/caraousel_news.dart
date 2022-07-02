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
    return SizedBox(
      height: size.height * 0.22,
      child: CarouselSlider.builder(
          options: CarouselOptions(
            height: size.height * 0.2,
            // viewportFraction: 1,
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
                  height: size.height * 0.2,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/news.jpg"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 1,
                          color: Colors.black.withOpacity(0.2),
                          offset: const Offset(0, 2)),
                    ],
                  ),
                  child: Glass(
                    children: [
                      Text(
                        "Sebaran Covid Terkini",
                        style: paragraphSemiBold2(cMainBlack),
                      ),
                      Text(
                        "DKI Jakarta Tertinggi, Disusul Jabar dan Jatim",
                        style: paragraphRegular4(cNeutral3),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      )
                    ],
                  )),
            );
          }),
    );
  }
}
