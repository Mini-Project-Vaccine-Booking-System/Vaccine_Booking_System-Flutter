import 'package:flutter/material.dart';
import 'components/body.dart';
import '../../constants.dart';

class EditAnggota extends StatelessWidget {
  const EditAnggota({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: TopBar(context, size, "Edit Anggota"),
      body: const Body(),
    );
  }
}
