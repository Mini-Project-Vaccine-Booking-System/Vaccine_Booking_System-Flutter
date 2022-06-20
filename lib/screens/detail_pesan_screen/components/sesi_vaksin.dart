import 'package:flutter/material.dart';

import '../../../constants.dart';

class SesiVaksin extends StatefulWidget {
  const SesiVaksin({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<SesiVaksin> createState() => _SesiVaksinState();
}

class _SesiVaksinState extends State<SesiVaksin> {
  var indexActive = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.size.height * 0.06,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                indexActive = index;
              });
            },
            child: Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: indexActive == index ? cPrimary1 : cMainWhite,
                border: Border.all(color: cPrimary1),
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 5,
                      color: Colors.grey.withOpacity(0.4),
                      offset: Offset(0, 1)),
                ],
              ),
              child: Center(
                child: Text(
                  "08:00 - 11:00",
                  style: paragraphLight2(
                      indexActive == index ? Colors.white : cPrimary1),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
