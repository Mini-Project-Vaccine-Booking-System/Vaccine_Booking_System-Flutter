import 'package:flutter/material.dart';
import '../../../bindings/package_binding.dart';
import '../../../bindings/component_binding.dart';
import '../../../bindings/model_binding.dart';
import '../../../bindings/view_model_binding.dart';
import '../../../constants.dart';
import 'top_card.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isLoading = false;
  final List<bool> _isOpen = [false, false];
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    var family = Provider.of<FamilyViewModel>(context);
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: size.height * 0.03,
        ),
        TopCard(size: size),
        SizedBox(
          height: size.height * 0.03,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: Text(
            "Tambah Pasien",
            style: paragraphSemiBold2(cMainBlack),
          ),
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: FormBuilder(
            key: _formKey,
            child: Column(
              children: [
                RoundedContainer(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: FormBuilderDropdown(
                      onChanged: (value) {
                        family.dataSelect = value as Family;
                      },
                      name: "pasien",
                      decoration:
                          const InputDecoration(border: InputBorder.none),
                      // initialValue: 'Male',
                      hint: const Text('Pilih Pasien'),
                      items: family.allData
                          .map((item) => DropdownMenuItem(
                                value: item,
                                child: Text(item.name),
                              ))
                          .toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: Text(
            "Informasi Syarat dan Ketentuan Vaksin",
            style: paragraphSemiBold2(cMainBlack),
          ),
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          width: size.width,
          decoration: BoxDecoration(
            border: Border.all(color: cNeutral2, width: 2),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  spreadRadius: 2,
                  blurRadius: 5,
                  color: Colors.black.withOpacity(0.2),
                  offset: Offset(0, 1)),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: ExpansionPanelList(
                elevation: 0,
                expandedHeaderPadding: EdgeInsets.zero,
                expansionCallback: (i, isOpen) =>
                    setState(() => _isOpen[i] = !isOpen),
                children: [
                  ExpansionPanel(
                    canTapOnHeader: true,
                    isExpanded: _isOpen[0],
                    headerBuilder: (context, isExpanded) => const ListTile(
                      title: Text(
                        "Syarat Vaksin",
                        style: TextStyle(
                          color: cPrimary1,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    body: Padding(
                      padding:
                          const EdgeInsets.only(left: 5, right: 5, bottom: 5),
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: size.width * 0.1,
                              height: 20,
                              child: const Center(
                                child: CircleAvatar(
                                  radius: 3,
                                  backgroundColor: cMainBlack,
                                ),
                              ),
                            ),
                            ConstrainedBox(
                              constraints:
                                  BoxConstraints(maxWidth: size.width * 0.75),
                              child: Text(
                                "Membawa kartu identitas (KTP, KK, SIM atau yang lainnya)",
                                style: paragraphRegular3(cMainBlack),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: size.width * 0.1,
                              height: 20,
                              child: const Center(
                                child: CircleAvatar(
                                  radius: 3,
                                  backgroundColor: cMainBlack,
                                ),
                              ),
                            ),
                            ConstrainedBox(
                              constraints:
                                  BoxConstraints(maxWidth: size.width * 0.75),
                              child: Text(
                                "Memakai masker",
                                style: paragraphRegular3(cMainBlack),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: size.width * 0.1,
                              height: 20,
                              child: const Center(
                                child: CircleAvatar(
                                  radius: 3,
                                  backgroundColor: cMainBlack,
                                ),
                              ),
                            ),
                            ConstrainedBox(
                              constraints:
                                  BoxConstraints(maxWidth: size.width * 0.75),
                              child: Text(
                                "Lolos pemeriksaan fisik di lokasi vaksinasi",
                                style: paragraphRegular3(cMainBlack),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        )
                      ]),
                    ),
                  ),
                  ExpansionPanel(
                    canTapOnHeader: true,
                    isExpanded: _isOpen[1],
                    headerBuilder: (context, isExpanded) => const ListTile(
                      title: Text(
                        "Ketentuan Fasilitas Kesehatan",
                        style: TextStyle(
                          color: cPrimary1,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    body: Padding(
                      padding:
                          const EdgeInsets.only(left: 5, right: 5, bottom: 5),
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: size.width * 0.1,
                              height: 20,
                              child: const Center(
                                child: CircleAvatar(
                                  radius: 3,
                                  backgroundColor: cMainBlack,
                                ),
                              ),
                            ),
                            ConstrainedBox(
                              constraints:
                                  BoxConstraints(maxWidth: size.width * 0.75),
                              child: Text(
                                "Tidak perlu janji temu, cukup booking jadwal vaksinasi melalui aplikasi",
                                style: paragraphRegular3(cMainBlack),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ]),
                    ),
                  )
                ]),
          ),
        ),
        SizedBox(
          height: size.height * 0.12,
        ),
        // Container(
        //   margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        //   child: isLoading == false
        //       ? RoundedButtonSolid(
        //           size: size,
        //           text: "Konfirmasi",
        //           onAction: () {
        //             setState(() {
        //               isLoading = !isLoading;
        //             });
        //             ticket
        //                 .saveTicket(
        //                     family_id: ticket.userSelect!.id,
        //                     vaccine_id: ticket.vaccineSelect!.id,
        //                     shcedule_id: ticket.scheduleSelect!.id,
        //                     hospital_id: ticket.hospitalSelect!.id)
        //                 .then((value) {
        //               setState(() {
        //                 isLoading = !isLoading;
        //               });

        //               Navigator.pushAndRemoveUntil(
        //                   context,
        //                   MaterialPageRoute(builder: (_) => PassScreen()),
        //                   (route) => false);
        //             });
        //           })
        //       : RoundedButtonLoading(size: size),
        // ),
        // SizedBox(
        //   height: size.height * 0.03,
        // )
      ]),
    );
  }
}
