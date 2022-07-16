import 'package:flutter/material.dart';
import '../../../bindings/component_binding.dart';
import '../../../constants.dart';

class VerticalList extends StatelessWidget {
  const VerticalList({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
              height: size.width * 0.5,
              margin: const EdgeInsets.only(bottom: 16),
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
              )
              );
        },
      ),
    );
  }
}