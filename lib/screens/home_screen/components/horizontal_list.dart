import 'package:flutter/material.dart';

import '../../../components/glass.dart';
import '../../../constants.dart';

class HorizontalList extends StatelessWidget {
  const HorizontalList({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.22,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
              width: size.width * 0.6,
              margin: const EdgeInsets.only(right: 16),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/rs.png"),
                      fit: BoxFit.fill),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Glass(
                children: [
                  Text(
                    "Rumah Sakit Kasih Ibu",
                    style: paragraphSemiBold2(Colors.white),
                  ),
                  Text(
                    "Jalan Slamet Riyadi Solo",
                    style: paragraphRegular4(Colors.white),
                  )
                ],
              ));
        },
      ),
    );
  }
}