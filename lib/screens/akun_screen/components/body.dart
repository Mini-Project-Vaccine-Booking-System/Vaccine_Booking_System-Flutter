import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vaccine/screens/welcome_screen/welcome_screen.dart';
import 'package:vaccine/view_model/auth_view_model.dart';

import '../../../constants.dart';
import '../../../view_model/account_view_model.dart';
import 'data_akun.dart';
import 'top_photo.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final account = Provider.of<AccoutnViewModel>(context);
    final auth = Provider.of<AuthViewModel>(context);
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Column(
        children: [
          // SizedBox(
          //   height: size.height * 0.02,
          // ),
          // SafeArea(
          //   child: Stack(
          //     alignment: Alignment.centerLeft,
          //     children: [
          //       Center(
          //         child: Text(
          //           "Daftar Vaksin",
          //           style: GoogleFonts.poppins(
          //               textStyle: const TextStyle(
          //                   color: cMainBlack,
          //                   fontSize: 18,
          //                   fontWeight: FontWeight.bold)),
          //         ),
          //       ),
          //       InkWell(
          //         onTap: () {
          //           Navigator.pop(context);
          //         },
          //         child: Container(
          //           width: 32,
          //           height: 32,
          //           decoration:
          //               BoxDecoration(color: cPrimary1, shape: BoxShape.circle),
          //           child: Icon(
          //             Icons.arrow_back_ios_rounded,
          //             color: Colors.white,
          //           ),
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          SizedBox(
            height: size.height * 0.03,
          ),
          TopPhoto(),
          SizedBox(
            height: size.height * 0.03,
          ),
          Text(
            account.data != null ? account.data!.name : "",
            style: headingSemiBold2(Colors.black),
          ),
          Text(
            account.data != null ? account.data!.nik : "",
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          DataAkun(
            size: size,
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  auth.logOut().then((value) => Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const WelcomeScreen()),
                        (Route) => false,
                      ));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                    color: cPrimary1,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 10,
                          color: Colors.black.withOpacity(0.4),
                          offset: Offset(0, 1)),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.logout,
                        color: cMainWhite,
                        size: 24,
                      ),
                      Text(
                        "Keluar",
                        style: paragraphSemiBold1(cMainWhite),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
        ],
      ),
    );
  }
}
