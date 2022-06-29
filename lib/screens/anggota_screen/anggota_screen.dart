import 'package:flutter/material.dart';
import 'package:vaccine/screens/anggota_screen/components/body.dart';

import '../../constants.dart';

class AnggotaScreen extends StatelessWidget {
  const AnggotaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Body());
  }
}
