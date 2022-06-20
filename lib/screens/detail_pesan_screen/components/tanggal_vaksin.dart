import 'package:flutter/material.dart';

import '../../../constants.dart';

class TanggalVaksin extends StatefulWidget {
  const TanggalVaksin({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<TanggalVaksin> createState() => _TanggalVaksinState();
}

class _TanggalVaksinState extends State<TanggalVaksin> {
  var indexActive = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.size.height * 0.1,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "19",
                        style: TextStyle(
                            color:
                                indexActive == index ? Colors.white : cPrimary1,
                            fontWeight: FontWeight.bold,
                            fontSize: 40),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Rabu",
                            style: TextStyle(
                                color: indexActive == index
                                    ? Colors.white
                                    : cPrimary1,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          Text(
                            "Juni",
                            style: TextStyle(
                                fontSize: 16,
                                color: indexActive == index
                                    ? Colors.white
                                    : cPrimary1),
                          )
                        ],
                      )
                    ],
                  )));
        },
      ),
    );
  }
}
