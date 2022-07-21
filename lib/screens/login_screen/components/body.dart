import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import 'package:vaccine/components/roundedButtonLoading.dart';
import 'package:vaccine/screens/register_screen/register_screen.dart';
import 'package:vaccine/view_model/auth_view_model.dart';
import 'package:validators/validators.dart';

import '../../../components/roundedButtonSolid.dart';
import '../../../constants.dart';
import '../../home_screen/home_screen.dart';
import 'email_field.dart';
import 'password_field.dart';

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
    var auth = Provider.of<AuthViewModel>(context);
    Size size = MediaQuery.of(context).size;

    void showError() {
      var snackBar = SnackBar(
        content: const Text(
          "Input tidak sesuai!",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: cFail,
        action: SnackBarAction(
            label: 'Abaikan', textColor: Colors.white, onPressed: () {}),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
                  EmailText(size: size),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  PasswordText(size: size),
                  SizedBox(
                    height: size.height * 0.06,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: isLoading == false
                        ? RoundedButtonSolid(
                            size: size,
                            text: "Masuk",
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

                                auth.email = email;
                                auth.password = password;

                                auth.signIn().then((value) {
                                  setState(() {
                                    isLoading = !isLoading;
                                  });

                                  if (value == false) {
                                    showError();
                                  } else {
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => const HomeScreen()),
                                        (route) => false);
                                  }
                                });
                              } else {
                                setState(() {
                                  isLoading = !isLoading;
                                });

                                showError();
                              }
                              /* 
                          _formKey.currentState!.save();
                          if (_formKey.currentState!.validate()) {
                            auth
                                .signIn(_formKey.currentState!.value["email"],
                                    _formKey.currentState!.value["password"])
                                .then((value) {
                              if (value == true) {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const HomeScreen()),
                                  (Route) => false,
                                );
                              }
                            });
                          } */
                            })
                        : RoundedButtonLoading(size: size),
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
                  "Belum punya akun?",
                  style: paragraphRegular3(cMainBlack),
                ),
                SizedBox(
                  width: size.width * 0.01,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const RegisterScreen()));
                  },
                  child: Text(
                    "Daftar",
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
