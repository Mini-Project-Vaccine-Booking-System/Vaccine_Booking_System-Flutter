import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaccine/screens/home_screen/components/skeleton.dart';
import '../../view_model/account_view_model.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future:
            Provider.of<AccoutnViewModel>(context, listen: false).inisialData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Skeleton();
          }

          return Body();
        },
      ),
    );
  }
}
