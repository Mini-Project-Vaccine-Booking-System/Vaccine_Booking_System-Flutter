import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../view_model/account_view_model.dart';

class DataAkun extends StatelessWidget {
  const DataAkun({Key? key, required this.size}) : super(key: key);
  final Size size;

  @override
  Widget build(BuildContext context) {
    final account = Provider.of<AccoutnViewModel>(context);
    final _formKey = GlobalKey<FormBuilderState>();
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
                  bottomModal(context, "name", "Masukkan nama kamu",
                      account.data!.name, _formKey);
                },
                child: Row(
                  children: [
                    Text(
                      account.data != null ? account.data!.name : "",
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
                  bottomModal(context, "nik", "Masukkan NIK kamu",
                      account.data!.nik, _formKey);
                },
                child: Row(
                  children: [
                    Text(
                      account.data != null ? account.data!.nik : "",
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
                  bottomModal(context, "usia", "Masukkan usia kamu",
                      account.data!.usia, _formKey);
                },
                child: Row(
                  children: [
                    Text(
                      account.data != null ? account.data!.usia : "",
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
                "Telp",
                style: paragraphSemiBold2(Colors.black),
              ),
              GestureDetector(
                onTap: () {
                  bottomModal(context, "telp", "Masukkan no telp kamu",
                      account.data!.telp, _formKey);
                },
                child: Row(
                  children: [
                    Text(
                      account.data != null ? account.data!.telp : "",
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
                  bottomModal(context, "email", "Masukkan email kamu",
                      account.data!.email, _formKey);
                },
                child: Row(
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 100),
                      child: Text(
                        account.data != null ? account.data!.email : "",
                        style: paragraphRegular2(Colors.black),
                        overflow: TextOverflow.ellipsis,
                      ),
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
                  bottomModal(context, "password", "Masukkan password kamu",
                      account.data!.password, _formKey);
                },
                child: Row(
                  children: [
                    Text(
                      account.data != null ? account.data!.password : "",
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

  Future<dynamic> bottomModal(
      BuildContext context, name, hint, initial, formKey) {
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
                        hint,
                        style: paragraphSemiBold2(Colors.black),
                      ),
                      FormBuilder(
                        key: formKey,
                        child: Column(
                          children: [
                            FormBuilderTextField(
                              decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: cNeutral1))),
                              initialValue: initial,
                              name: name,
                              autofocus: true,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.02),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                      style: ButtonStyle(
                                        side: MaterialStateProperty.all(
                                            const BorderSide(
                                                width: 2, color: cPrimary1)),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
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
                                      onPressed: () {
                                        formKey.currentState!.save();
                                        if (formKey.currentState!.validate()) {
                                          Provider.of<AccoutnViewModel>(context,
                                                  listen: false)
                                              .updateAccount(
                                                  name,
                                                  formKey.currentState!
                                                      .value[name])
                                              .then((value) =>
                                                  Navigator.pop(context));
                                        }
                                      },
                                      child: Text("Simpan",
                                          style: paragraphBold2(cMainWhite)))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ]),
              ),
            ));
  }
}
