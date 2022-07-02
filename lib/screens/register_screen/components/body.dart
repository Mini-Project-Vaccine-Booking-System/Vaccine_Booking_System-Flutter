import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import 'package:vaccine/components/roundedButtonLoading.dart';
import 'package:vaccine/screens/fill_data_screen/fill_data_screen.dart';
import 'package:vaccine/screens/login_screen/login_screen.dart';
import 'package:vaccine/view_model/auth_view_model.dart';
import 'package:validators/validators.dart';

import '../../../components/roundedButtonSolid.dart';
import '../../../constants.dart';
import '../../home_screen/home_screen.dart';
import 'email_field.dart';
import 'password_field.dart';
import 'welcoming_text.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isLoading = false;
  late String email;
  late String password;
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    var auth = Provider.of<AuthViewModel>(context, listen: false);
    Size size = MediaQuery.of(context).size;

    void showError(String message) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor: cFail,
        behavior: SnackBarBehavior.floating,
        action: SnackBarAction(
          label: 'Abaikan',
          textColor: Colors.white,
          onPressed: () {},
        ),
      ));
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.1,
          ),
          Center(
            child: Text(
              "VaksinQu",
              style: headingBold1(cPrimary1),
            ),
          ),
          SizedBox(
            height: size.height * 0.1,
          ),
          FormBuilder(
              key: _formKey,
              child: Column(
                children: [
                  EmailText(),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  PasswordText(),
                  SizedBox(
                    height: size.height * 0.06,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: isLoading == true
                        ? RoundedButtonLoading(size: size)
                        : RoundedButtonSolid(
                            size: size,
                            text: "Daftar",
                            onAction: () {
                              _formKey.currentState!.save();
                              setState(() {
                                isLoading = !isLoading;
                              });
                              if (isValid(_formKey.currentState!.value["email"],
                                  _formKey.currentState!.value["password"])) {
                                email = _formKey.currentState!.value["email"];
                                password =
                                    _formKey.currentState!.value["password"];
                                auth
                                    .checkEmail(
                                        _formKey.currentState!.value["email"])
                                    .then((value) {
                                  setState(() {
                                    isLoading = !isLoading;
                                  });

                                  if (!value.isEmpty) {
                                    showError("Email sudah digunakan");
                                  } else {
                                    auth.email = email;
                                    auth.password = password;
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => FillDataScreen()));
                                    print(auth.email);
                                  }
                                });
                              } else {
                                setState(() {
                                  isLoading = !isLoading;
                                });

                                showError(
                                    "Data yang anda masukkan tidak tepat!");
                              }
                              //   auth
                              //       .signUp(
                              //           "",
                              //           "",
                              //           _formKey.currentState!.value["email"],
                              //           _formKey.currentState!.value["password"],
                              //           "",
                              //           "",
                              //           "",
                              //           "",
                              //           "")
                              //       .then((value) {
                              //     if (value == true) {
                              //       Navigator.pushAndRemoveUntil(
                              //         context,
                              //         MaterialPageRoute(
                              //             builder: (_) => const HomeScreen()),
                              //         (Route) => false,
                              //       );
                              //     } else {
                              //       print(value);
                              //     }
                              //   });
                              // }
                            }),
                  ),
                ],
              )),
          SizedBox(height: size.height * 0.02),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sudah punya akun?",
                  style: paragraphRegular3(cMainBlack),
                ),
                SizedBox(
                  width: size.width * 0.01,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => LoginScreen()),
                        (route) => false);
                  },
                  child: Text(
                    "Masuk",
                    style: paragraphRegular3(cPrimary1),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  bool isValid(email, password) {
    bool result = false;

    if (isEmail(email.toString()) && isLength(password.toString(), 8)) {
      result = true;
    }

    return result;
  }
}
