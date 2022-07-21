import 'package:flutter/material.dart';
import '../../../bindings/package_binding.dart';
import '../../../bindings/component_binding.dart';
import '../../../bindings/view_model_binding.dart';
import '../../../constants.dart';
import '../../confirmation_screen/confirmation_scree.dart';

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
  int? indexBox;
  @override
  Widget build(BuildContext context) {
    var hospital = Provider.of<HospitalViewModel>(context);
    final isLoading = hospital.state == HospitalViewState.loading;
    final isError = hospital.state == HospitalViewState.error;

    if (isLoading) {
      return Shimmer.fromColors(
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
      );
    }

    if (isError) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: widget.size.width * 0.05),
        width: widget.size.width,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
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
            Center(
                child: Image.asset(
              "assets/images/error.png",
              scale: 2.5,
            )),
            Center(
              child: Text(
                "Mendapatkan Data Gagal!",
                style: paragraphBold3(cMainBlack),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      );
    }

    if (hospital.dataHome.isEmpty) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: widget.size.width * 0.05),
        width: widget.size.width,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
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
            Center(
                child: Image.asset(
              "assets/images/pana.png",
            )),
            Center(
              child: Text(
                "Yah:( di lokasi yang kamu cari belum tersedia pelayanan vaksinasi COVID-19, pantau secara berkala ya!",
                style: paragraphRegular3(cMainBlack),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      );
    } else {
      return SizedBox(
        height: widget.size.height * 0.25,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: hospital.dataHome.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    hospital.dataSelect = hospital.dataHome[index];
                    Provider.of<FamilyViewModel>(context, listen: false)
                        .getAllData()
                        .then((value) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const ConfirmationScreen()));
                    });
                  },
                  child: Container(
                      height: widget.size.height * 0.24,
                      width: widget.size.width * 0.7,
                      margin: EdgeInsets.only(
                          left: widget.size.width * 0.05,
                          right:
                              hospital.dataHome.last == hospital.dataHome[index]
                                  ? widget.size.width * 0.05
                                  : 0.0),
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage("assets/images/rs.png"),
                            fit: BoxFit.fill),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 1,
                              color: Colors.black.withOpacity(0.2),
                              offset: const Offset(0, 2)),
                        ],
                      ),
                      child: Stack(
                        children: [
                          Glass(
                            children: [
                              Text(
                                hospital.dataHome[index].name,
                                style: paragraphSemiBold2(cMainBlack),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              Text(
                                hospital.dataHome[index].address,
                                style: paragraphRegular4(cNeutral3),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ],
                            status: "hospital",
                          ),
                          Positioned(
                              top: 0,
                              left: 0,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: const BoxDecoration(
                                    color: cPrimary1,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(15),
                                      bottomRight: Radius.circular(15),
                                    )),
                                child: Center(
                                    child: Text(
                                  hospital.dataHome[index].vaccine,
                                  style: paragraphSemiBold3(cMainWhite),
                                  textAlign: TextAlign.center,
                                )),
                              )),
                          Positioned(
                              top: 0,
                              right: 0,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: const BoxDecoration(
                                    color: cNeutral2,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      topLeft: Radius.circular(15),
                                      bottomLeft: Radius.circular(15),
                                    )),
                                child: Center(
                                    child: Text(
                                  "${hospital.dataHome[index].start.substring(0, 5)} - ${hospital.dataHome[index].end.substring(0, 5)}",
                                  style: paragraphRegular3(cMainBlack),
                                  textAlign: TextAlign.center,
                                )),
                              )),
                        ],
                      )),
                ),
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
}
