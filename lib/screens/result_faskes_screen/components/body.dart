import 'package:flutter/material.dart';
import '../../../bindings/package_binding.dart';
import '../../../bindings/view_model_binding.dart';
import '../../../bindings/component_binding.dart';
import '../../confirmation_screen/confirmation_scree.dart';
import '../../../constants.dart';

class Body extends StatefulWidget {
  const Body({Key? key, required this.date}) : super(key: key);
  final DateTime date;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int? indexBox;
  @override
  Widget build(BuildContext context) {
    var hospital = Provider.of<HospitalViewModel>(context);
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: hospital.dataSession.isEmpty
          ? const StateNull(
              text:
                  "Silahkan lakukan pencarian dengan kata kunci lain untuk mendapatkan data.",
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.02,
                ),
                Text(
                  "Hasil pencarian tanggal ${DateFormat("d MMMM yyyy").format(widget.date)}",
                  style: paragraphSemiBold3(cNeutral3),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                ListView.builder(
                  itemCount: hospital.dataSession.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                        height: size.height * 0.23,
                        width: size.width,
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.05,
                            vertical: size.height * 0.015),
                        margin: const EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  color: Colors.black.withOpacity(0.4),
                                  offset: const Offset(0, 1)),
                            ],
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              hospital.dataSession[index].name,
                              style: paragraphSemiBold1(cMainBlack),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              hospital.dataSession[index].address,
                              style: paragraphRegular3(cNeutral3),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                  color: cNeutral3.withOpacity(0.30),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.medical_services_outlined,
                                            size: 20,
                                            color: cNeutral3,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            hospital.dataSession[index].vaccine,
                                            style: paragraphSemiBold2(cFail),
                                          )
                                        ],
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          const Icon(
                                            Icons.timer_sharp,
                                            size: 20,
                                            color: cNeutral3,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "${hospital.dataSession[index].start.substring(0, 5)} - ${hospital.dataSession[index].end.substring(0, 5)}",
                                            style:
                                                paragraphSemiBold3(cMainBlack),
                                          )
                                        ],
                                      )),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: Text(
                                    "Stok : ${hospital.dataSession[index].stock}",
                                    style: paragraphRegular3(cMainBlack),
                                  ),
                                ),
                                Flexible(
                                    flex: 2,
                                    child: SizedBox(
                                      width: size.width,
                                      child: ElevatedButton(
                                          onPressed: () {
                                            hospital.dataSelect =
                                                hospital.dataSession[index];
                                            Provider.of<FamilyViewModel>(
                                                    context,
                                                    listen: false)
                                                .getAllData()
                                                .then((value) {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          const ConfirmationScreen()));
                                            });
                                          },
                                          style: ElevatedButton.styleFrom(
                                              primary: cPrimary1,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              elevation: 3),
                                          child: Text(
                                            "Pilih",
                                            style:
                                                paragraphSemiBold1(cMainWhite),
                                          )),
                                    ))
                              ],
                            )
                          ],
                        ));
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
