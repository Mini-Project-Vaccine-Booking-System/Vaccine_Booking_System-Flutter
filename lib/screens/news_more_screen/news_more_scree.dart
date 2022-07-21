import 'package:flutter/material.dart';
import 'components/body.dart';
import '../../constants.dart';

class NewsMoreScreen extends StatelessWidget {
  const NewsMoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: TopBar(context, size, "Berita"),
      body: const Body(),
    );
  }
}
