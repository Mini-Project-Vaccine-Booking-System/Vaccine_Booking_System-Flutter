import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import 'package:vaccine/screens/home_screen/home_screen.dart';
import 'package:vaccine/screens/register_screen/register_screen.dart';
import 'package:vaccine/view_model/auth_view_model.dart';

import '../../../components/roundedButtonSolid.dart';
import '../../../constants.dart';
import 'email_field.dart';
import 'password_field.dart';
import 'welcoming_text.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var auth = Provider.of<AuthViewModel>(context);
    Size size = MediaQuery.of(context).size;
    final _formKey = GlobalKey<FormBuilderState>();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WelcomeText(size: size),
          SizedBox(
            height: size.height * 0.03,
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
                    child: RoundedButtonSolid(
                        size: size,
                        text: "Masuk",
                        onAction: () {
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
                          }
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
                  "Belum punya akun?",
                  style: paragraphRegular3(cMainBlack),
                ),
                SizedBox(
                  width: size.width * 0.01,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => RegisterScreen()));
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
}
