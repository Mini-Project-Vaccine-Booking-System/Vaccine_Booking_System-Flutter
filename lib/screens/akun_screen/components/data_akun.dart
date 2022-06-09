import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../constants.dart';

class DataAkun extends StatelessWidget {
  const DataAkun({Key? key, required this.size}) : super(key: key);
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              spreadRadius: 2,
              blurRadius: 10,
              color: Colors.black.withOpacity(0.1),
              offset: Offset(0, 1)),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Nama Lengkap",
                style: paragraphSemiBold2(Colors.black),
              ),
              GestureDetector(
                onTap: () {
                  bottomModal(context);
                },
                child: Row(
                  children: [
                    Text(
                      "Jerome Bell",
                      style: paragraphRegular2(Colors.black),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 15,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.black,
            thickness: 0.5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "NIK",
                style: paragraphSemiBold2(Colors.black),
              ),
              GestureDetector(
                onTap: () {
                  bottomModal(context);
                },
                child: Row(
                  children: [
                    Text(
                      "3578094008020003",
                      style: paragraphRegular2(Colors.black),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 15,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.black,
            thickness: 0.5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Usia",
                style: paragraphSemiBold2(Colors.black),
              ),
              GestureDetector(
                onTap: () {
                  bottomModal(context);
                },
                child: Row(
                  children: [
                    Text(
                      "21",
                      style: paragraphRegular2(Colors.black),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 15,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.black,
            thickness: 0.5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "No. Telp",
                style: paragraphSemiBold2(Colors.black),
              ),
              GestureDetector(
                onTap: () {
                  bottomModal(context);
                },
                child: Row(
                  children: [
                    Text(
                      "0873264862863",
                      style: paragraphRegular2(Colors.black),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 15,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.black,
            thickness: 0.5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Email",
                style: paragraphSemiBold2(Colors.black),
              ),
              GestureDetector(
                onTap: () {
                  bottomModal(context);
                },
                child: Row(
                  children: [
                    Text(
                      "jerome@gmail.com",
                      style: paragraphRegular2(Colors.black),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 15,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.black,
            thickness: 0.5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Password",
                style: paragraphSemiBold2(Colors.black),
              ),
              GestureDetector(
                onTap: () {
                  bottomModal(context);
                },
                child: Row(
                  children: [
                    Text(
                      "***********",
                      style: paragraphRegular2(Colors.black),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 15,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<dynamic> bottomModal(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) => Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Container(
                width: size.width,
                height: 150,
                child: ListView(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.05, vertical: 15),
                    children: [
                      Text(
                        "Masukkan nama kamu",
                        style: paragraphSemiBold2(Colors.black),
                      ),
                      FormBuilderTextField(
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: cNeutral1))),
                        initialValue: "Jerome Bell",
                        name: "nama",
                        autofocus: true,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.02),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                style: ButtonStyle(
                                  side: MaterialStateProperty.all(
                                      const BorderSide(
                                          width: 2, color: cPrimary1)),
                                ),
                                onPressed: () {},
                                child: Text(
                                  "Batal",
                                  style: paragraphBold2(cPrimary1),
                                )),
                            SizedBox(
                              width: size.width * 0.02,
                            ),
                            TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: cPrimary1,
                                ),
                                onPressed: () {},
                                child: Text("Simpan",
                                    style: paragraphBold2(cMainWhite)))
                          ],
                        ),
                      )
                    ]),
              ),
            ));
  }
}
