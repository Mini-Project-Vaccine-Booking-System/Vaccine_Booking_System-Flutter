import 'package:flutter/material.dart';
import 'package:vaccine/screens/pass_screen/components/body.dart';

import '../../components/roundedButtonSolid.dart';
import '../../constants.dart';
import '../home_screen/home_screen.dart';

class PassScreen extends StatelessWidget {
  const PassScreen({Key? key, this.status = false}) : super(key: key);
  final bool status;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: status == true ? cPrimary1 : null,
      // appBar: status == false
      //     ? AppBar(
      //         title: Text("Pendaftaran Berhasil"),
      //         centerTitle: true,
      //         backgroundColor: cPrimary1,
      //         elevation: 0,
      //         automaticallyImplyLeading: false,
      //       )
      //     : null,
      body: Body(status: status),
      bottomSheet: status == false ? Container(
        width: size.width,
        height: 70,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
                spreadRadius: 2,
                blurRadius: 2,
                color: Colors.black.withOpacity(0.2),
                offset: Offset(0, 1)),
          ],
        ),
        child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: RoundedButtonSolid(
                      size: size,
                      text: "Halaman Utama",
                      onAction: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (_) => HomeScreen()),
                            (route) => false);
                      }),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                      color: cMainWhite,
                      border: Border.all(color: cPrimary1, width: 2),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15))),
                  child: const Icon(
                    Icons.share,
                    color: cPrimary1,
                    size: 30,
                  ),
                )
              ],
            )),
      ) : null,
    );
  }
}
