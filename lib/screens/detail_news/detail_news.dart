import 'package:flutter/material.dart';
import 'components/body.dart';

import '../../constants.dart';

class DetailNews extends StatelessWidget {
  const DetailNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: TopBar(context, size, "Detail Berita"),
      body: const Body(),
    );
  }
}
