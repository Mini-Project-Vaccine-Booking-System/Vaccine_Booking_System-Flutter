import 'package:flutter/material.dart';
import 'package:vaccine/screens/anggota_screen/components/body.dart';

import '../../constants.dart';

class AnggotaScreen extends StatelessWidget {
  const AnggotaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              shape:
                  const Border(bottom: BorderSide(color: cNeutral2, width: 1)),
              leadingWidth: 50,
              leading: IconButton(
                  padding: const EdgeInsets.all(0.0),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_rounded,
                    size: 24,
                    color: cMainWhite,
                  )),
              backgroundColor: cPrimary1,
              elevation: 0,
              title: const Text(
                "Anggota Kelompok",
                style: TextStyle(
                    color: cMainWhite,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              centerTitle: false,
              bottom: TabBar(
                labelColor: cPrimary1,
                unselectedLabelColor: cMainWhite,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  color: Colors.white,
                ),
                tabs: [
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Tambah Anggota"),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Daftar Anggota"),
                    ),
                  )
                ],
              ),
            ),
            body: Body()));
  }
}
