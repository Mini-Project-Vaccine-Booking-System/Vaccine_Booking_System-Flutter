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
            height: widget.size.height * 0.22,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: hospital.dataHome.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onLongPress: () {
                    if (hospital.dataHome[index].availability == true) {
                      setState(() {
                        indexBox = index;
                      });

                      hospital
                          .initialData(hospital.dataHome[index].id,
                              status: 'home')
                          .then((value) {
                        setState(() {
                          indexBox = null;
                        });

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => DetailPesanScreen()));
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: cPrimary1,
                        behavior: SnackBarBehavior.floating,
                        content: const Text(
                          "Jadwal tidak tersedia",
                          style: TextStyle(color: Colors.white),
                        ),
                        action: SnackBarAction(
                            label: 'Abaikan',
                            textColor: Colors.white,
                            onPressed: () {}),
                      ));
                    }
                  },
                  child: Stack(
                    children: [
                      Container(
                          width: widget.size.width * 0.6,
                          margin: const EdgeInsets.only(right: 16),
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/images/rs.png"),
                                  fit: BoxFit.fill),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Glass(
                            children: [
                              Text(
                                hospital.dataHome[index].name,
                                style: paragraphSemiBold2(Colors.white),
                              ),
                              Text(
                                hospital.dataHome[index].address,
                                style: paragraphRegular4(Colors.white),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
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
                  ),
                );
              },
            ),
          );
  }
}
