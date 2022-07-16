import 'package:flutter/material.dart';
import '../../../bindings/package_binding.dart';
import '../../../bindings/view_model_binding.dart';
import '../../../bindings/component_binding.dart';
import 'daftar_anggota.dart';
import 'tambah_anggota.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var family = Provider.of<FamilyViewModel>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Column(
        children: [
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
