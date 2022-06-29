import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vaccine/components/roundedButtonLoading.dart';
import 'package:vaccine/screens/home_screen/home_screen.dart';

import '../../../components/roundedButtonSolid.dart';
import '../../../components/roundedContainer.dart';
import '../../../constants.dart';
import '../../../view_model/auth_view_model.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    var auth = Provider.of<AuthViewModel>(context, listen: false);
    final _formKey = GlobalKey<FormBuilderState>();
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Column(children: [
        SizedBox(
          height: size.height * 0.02,
        ),
        SafeArea(
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Center(
                child: Text(
                  "Data Profil",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          color: cMainBlack,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 32,
                  height: 32,
                  decoration:
                      BoxDecoration(color: cPrimary1, shape: BoxShape.circle),
                  child: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        Center(
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 15, right: 15, left: 15),
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: cMainWhite,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 2,
                        blurRadius: 10,
                        color: Colors.black.withOpacity(0.4),
                        offset: Offset(0, 1)),
                  ],
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/images/user-avatar.png")),
                ),
              ),
              Positioned(
                  bottom: 2,
                  right: 2,
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          shape: BoxShape.rectangle,
                          color: cPrimary1),
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: cMainWhite,
                      ),
                    ),
                  )),
            ],
          ),
        ),
        FormBuilder(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.03,
              ),
              Text(
                "Nama Lengkap",
                style: paragraphMedium2(cMainBlack),
              ),
              BuildTextField(
                size: size,
                inputType: TextInputType.name,
                name: "username",
                hint: "ketik nama lengkap disini",
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                "NIK",
                style: paragraphMedium2(cMainBlack),
              ),
              BuildTextField(
                size: size,
                inputType: TextInputType.number,
                name: "nik",
                hint: "ketik nik disini",
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                "Usia",
                style: paragraphMedium2(cMainBlack),
              ),
              BuildTextField(
                size: size,
                inputType: TextInputType.number,
                name: "usia",
                hint: "ketik usia disini",
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                "No. Handphone",
                style: paragraphMedium2(cMainBlack),
              ),
              BuildTextField(
                size: size,
                inputType: TextInputType.phone,
                name: "phone",
                hint: "ketik no handphone disini",
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                "Jenis Kelamin",
                style: paragraphMedium2(cMainBlack),
              ),
              BuildTextField(
                size: size,
                inputType: TextInputType.name,
                name: "gender",
                hint: "ketik jenis kelamin disini",
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              isLoading != true
                  ? RoundedButtonSolid(
                      size: size,
                      text: "Simpan",
                      onAction: () {
                        setState(() {
                          isLoading = !isLoading;
                        });
                        _formKey.currentState!.save();
                        if (_formKey.currentState!.validate()) {
                          auth
                              .signUp(
                                  _formKey.currentState!.value["username"],
                                  _formKey.currentState!.value["nik"],
                                  _formKey.currentState!.value["usia"],
                                  _formKey.currentState!.value["phone"],
                                  _formKey.currentState!.value["gender"])
                              .then((value) {
                            setState(() {
                              isLoading = !isLoading;
                            });

                            if (value == true) {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => HomeScreen()),
                                  (route) => false);
                            }
                          });
                        }
                      })
                  : RoundedButtonLoading(size: size)
            ],
          ),
        ),
        SizedBox(
          height: size.height * 0.03,
        )
      ]),
    );
  }
}

class BuildTextField extends StatelessWidget {
  const BuildTextField(
      {Key? key,
      required this.size,
      required this.name,
      required this.inputType,
      required this.hint})
      : super(key: key);

  final Size size;
  final String name;
  final TextInputType inputType;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return roundedContainer(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        child: FormBuilderTextField(
          keyboardType: inputType,
          name: name,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: paragraphRegular1(cNeutral1),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
