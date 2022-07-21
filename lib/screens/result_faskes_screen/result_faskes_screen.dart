import 'package:flutter/material.dart';
import 'components/body.dart';
import '../../constants.dart';

class ResultFaskesScreen extends StatelessWidget {
  const ResultFaskesScreen({Key? key, required this.date}) : super(key: key);
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: TopBar(context, size, "Fasilitas Kesehatan"),
      body: Body(
        date: date,
      ),
    );
  }
}
