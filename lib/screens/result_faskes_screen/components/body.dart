import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaccine/screens/detail_pesan_screen/detail_pesan_screen.dart';
import 'package:vaccine/view_model/hospital_view_model.dart';

import '../../../constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var hospital = Provider.of<HospitalViewModel>(context);
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.03,
          ),
          Text(
            "Hasil pencarian berdasarkan filter",
            style: paragraphSemiBold3(cNeutral1),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          hospital.data.isEmpty
              ? Text("Data tidak tersedia")
              : ListView.builder(
                  itemCount: hospital.data.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    print(hospital.data[index].availability);
                    return GestureDetector(
                      onTap: () {
                        hospital.data[index].availability == true
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => DetailPesanScreen()))
                            : ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(
                                content: Text("Jadwal tidak tersedia"),
                                duration: Duration(seconds: 1),
                              ));
                      },
                      child: Container(
                        height: size.height * 0.13,
                        width: size.width,
                        margin: const EdgeInsets.only(bottom: 15),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  color: Colors.black.withOpacity(0.4),
                                  offset: Offset(0, 1)),
                            ],
                            border: hospital.data[index].availability == false
                                ? Border.all(color: cPrimary1, width: 2)
                                : Border.all(color: Colors.transparent),
                            color: hospital.data[index].availability == true
                                ? cPrimary1
                                : cMainWhite,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                shape: BoxShape.rectangle,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage("assets/images/rs.png")),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  hospital.data[index].name,
                                  style: paragraphSemiBold1(
                                    hospital.data[index].availability == true
                                        ? cMainWhite
                                        : cMainBlack,
                                  ),
                                ),
                                ConstrainedBox(
                                  constraints: BoxConstraints(maxWidth: 180),
                                  child: Text(
                                    hospital.data[index].address,
                                    style: paragraphRegular3(
                                      hospital.data[index].availability == true
                                          ? cMainWhite
                                          : cMainBlack,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                hospital.data[index].availability == true
                                    ? Row(
                                        children: [
                                          const Icon(
                                            Icons.check_circle_rounded,
                                            color: cSuccess,
                                            size: 15,
                                          ),
                                          Text(
                                            "Vaksin Tersedia",
                                            style: paragraphSemiBold4(cSuccess),
                                          )
                                        ],
                                      )
                                    : Row(
                                        children: [
                                          const Icon(
                                            Icons.error_outlined,
                                            color: cFail,
                                            size: 15,
                                          ),
                                          Text(
                                            "Vaksin Tidak Tersedia",
                                            style: paragraphSemiBold4(cFail),
                                          )
                                        ],
                                      )
                              ],
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 24,
                              color: hospital.data[index].availability == true
                                  ? cMainWhite
                                  : cNeutral3,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
          SizedBox(
            height: size.height * 0.03,
          )
        ],
      ),
    );
  }
}
