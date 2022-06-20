import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaccine/view_model/family_view_mode.dart';
import 'daftar_anggota.dart';
import 'tambah_anggota.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isInit = true;
  @override
  void didChangeDependencies() {
    if (isInit == true) {
      Provider.of<FamilyViewModel>(context, listen: false).inisialData();
      isInit = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return TabBarView(
        children: [TambahAnggota(size: size), DaftarAnggota(size: size)]);
  }
}
