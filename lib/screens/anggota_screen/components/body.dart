import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vaccine/view_model/family_view_model.dart';
import 'package:vaccine/view_model/ticket_view_model.dart';
import '../../../components/stateFailed.dart';
import '../../../constants.dart';
import 'daftar_anggota.dart';
import 'tambah_anggota.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // bool? isInit = null;
  // @override
  // void didChangeDependencies() {
  //   if (isInit == null) {
  //     Provider.of<FamilyViewModel>(context, listen: false).inisialData();
  //     isInit = false;
  //   }
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var family = Provider.of<FamilyViewModel>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Column(
        children: [
          // SizedBox(
          //   height: size.height * 0.03,
          // ),
          // Container(
          //   height: 48,
          //   decoration: BoxDecoration(
          //       color: Color(0xFF292639),
          //       borderRadius: BorderRadius.circular(10)),
          //   child: const Padding(
          //     padding: EdgeInsets.all(7.0),
          //     child: TabBar(
          //         indicator: BoxDecoration(
          //             color: cPrimary1,
          //             borderRadius: BorderRadius.all(Radius.circular(8))),
          //         tabs: [
          //           Tab(
          //             text: "Tambah Anggota",
          //           ),
          //           Tab(
          //             text: "Daftar Anggota",
          //           ),
          //         ]),
          //   ),
          // ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Expanded(
            child:
                TabBarView(children: [TambahAnggota(size: size), body(family)]),
          ),
        ],
      ),
    );
  }

  Widget body(FamilyViewModel viewModel) {
    Size size = MediaQuery.of(context).size;
    final isLoading = viewModel.state == FamilyViewState.loading;
    final isError = viewModel.state == FamilyViewState.error;

    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (isError) {
      return const StateFailed();
    }

    return DaftarAnggota(size: size);
  }
}
