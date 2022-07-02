import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vaccine/screens/detail_pesan_screen/detail_pesan_screen.dart';

import '../../../components/glass.dart';
import '../../../constants.dart';
import '../../../view_model/hospital_view_model.dart';

class HorizontalList extends StatefulWidget {
  const HorizontalList({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<HorizontalList> createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  bool? isInit = null;

  @override
  void didChangeDependencies() async {
    if (isInit == null) {
      await Provider.of<HospitalViewModel>(context, listen: false)
          .homeData()
          .then((value) {
        if (value == true) {
          setState(() {
            isInit = false;
          });
        }
      });
    }
    super.didChangeDependencies();
  }

  int? indexBox = null;
  @override
  Widget build(BuildContext context) {
    var hospital = Provider.of<HospitalViewModel>(context, listen: false);
    return isInit == null
        ? Shimmer.fromColors(
            baseColor: Colors.grey[500]!,
            highlightColor: Colors.grey[300]!,
            child: Container(
              width: widget.size.width,
              height: 150,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.grey,
              ),
            ),
          )
        : SizedBox(
            height: widget.size.height * 0.25,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: hospital.dataHome.length,
              itemBuilder: (context, index) {
                return /* Container(
                  margin: const EdgeInsets.only(right: 16),
                  width: widget.size.width * 0.6,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 1,
                          color: Colors.black.withOpacity(0.2),
                          offset: const Offset(0, 2)),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: widget.size.width,
                        height: 100,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/rs.png"),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20)),
                        ),
                      )
                    ],
                  ),
                ); */
                    Column(
                  children: [
                    Container(
                        height: widget.size.height * 0.24,
                        width: widget.size.width * 0.7,
                        margin: EdgeInsets.only(
                            left: widget.size.width * 0.05,
                            right: hospital.dataHome.last ==
                                    hospital.dataHome[index]
                                ? widget.size.width * 0.05
                                : 0.0),
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage("assets/images/rs.png"),
                              fit: BoxFit.fill),
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
                              hospital.dataHome[index].name,
                              style: paragraphSemiBold2(cMainBlack),
                            ),
                            Text(
                              hospital.dataHome[index].address,
                              style: paragraphRegular4(cNeutral3),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                  color: cNeutral3.withOpacity(0.30),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      "08.00 - 12.00",
                                      style: paragraphSemiBold3(cMainBlack),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      "Sinovac",
                                      style: paragraphBold2(cPrimary1),
                                      textAlign: TextAlign.right,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        )),
                    if (indexBox == index) ...[
                      SizedBox(
                        width: widget.size.width * 0.6,
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: cPrimary1,
                          ),
                        ),
                      )
                    ]
                  ],
                );
              },
            ),
          );
  }
}
