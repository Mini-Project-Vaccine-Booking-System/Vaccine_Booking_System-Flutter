import 'package:flutter/material.dart';
import '../../../bindings/package_binding.dart';
import '../../screens/anggota_screen/components/body.dart';
import '../../constants.dart';

class AnggotaScreen extends StatelessWidget {
  const AnggotaScreen({Key? key, this.currentIndex = 0}) : super(key: key);
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      initialIndex: currentIndex,
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0.7,
            centerTitle: true,
            titleSpacing: 0,
            title: Text(
              "Daftar Anggota",
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      color: cMainBlack,
                      fontSize: 24,
                      fontWeight: FontWeight.w600)),
            ),
            leading: Container(
              margin: EdgeInsets.only(left: size.width * 0.02),
              decoration: BoxDecoration(
                border: Border.all(
                    width: 1, color: Theme.of(context).scaffoldBackgroundColor),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_outlined,
                  size: 25,
                  color: cMainBlack,
                ),
              ),
            ),
            bottom: TabBar(
                labelStyle: paragraphSemiBold3(cNeutral3),
                labelColor: cPrimary1,
                unselectedLabelColor: cNeutral3,
                tabs: const [
                  Tab(
                    text: 'Tambah Anggota',
                  ),
                  Tab(
                    text: 'Daftar Anggota',
                  )
                ]),
          ),
          body: const Body()),
    );
  }
}
