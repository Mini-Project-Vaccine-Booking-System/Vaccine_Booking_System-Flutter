import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaccine/screens/anggota_screen/anggota_screen.dart';

import '../../../constants.dart';
import '../../../view_model/account_view_model.dart';

class TopCard extends StatelessWidget {
  const TopCard({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    final account = Provider.of<AccoutnViewModel>(context);
    return Container(
      width: size.width,
      height: 120,
      decoration: const BoxDecoration(
        color: cPrimary1,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        // boxShadow: [
        //   BoxShadow(
        //       spreadRadius: 2,
        //       blurRadius: 1,
        //       color: Colors.black.withOpacity(0.2),
        //       offset: Offset(0, 1)),
        // ],
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: size.width * 0.05, top: size.height * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: size.width * 0.6,
                  child: Text(
                    "Ayo dapatkan vaksin untuk hidup lebih sehat",
                    style: paragraphSemiBold2(cMainWhite),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: cPrimary3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    onPressed: () {},
                    child: Text(
                      "Daftar Sekarang",
                      style: paragraphBold3(Colors.white),
                    ))
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                "assets/images/image_banner.png",
                fit: BoxFit.cover,
                scale: 1.4,
              ))
        ],
      ),
      /* Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.08, vertical: size.height * 0.02),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      account.data != null
                          ? account.data!.name
                          : "Nama belum diisi",
                      style: paragraphBold1(Colors.white),
                    ),
                    SizedBox(
                      height: size.height * 0.002,
                    ),
                    Text(
                      account.data != null ? account.data!.nik : "",
                      style: paragraphRegular3(cMainWhite),
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => AnggotaScreen()));
                    },
                    icon: Icon(
                      Icons.add_box_rounded,
                      color: cMainWhite,
                      size: 28,
                    ))
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.notifications,
                  color: cMainWhite,
                ),
                SizedBox(width: size.width * 0.01),
                Text(
                  "Pastikan data sudah lengkap",
                  style: paragraphMedium4(cMainWhite),
                ),
              ],
            )
          ],
        ),
      ), */
    );
  }
}
