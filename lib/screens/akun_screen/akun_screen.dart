import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/stateFailed.dart';
import '../../constants.dart';
import '../../view_model/account_view_model.dart';
import 'components/body.dart';

class Akun extends StatelessWidget {
  const Akun({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final account = Provider.of<AccoutnViewModel>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: TopBar(context, size, "Profil"),
      body: body(account),
    );
  }

  Widget body(AccoutnViewModel viewModel) {
    final isLoading = viewModel.state == AccountViewState.loading;
    final isError = viewModel.state == AccountViewState.error;

    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (isError) {
      return const StateFailed();
    }

    return Body();
  }
}
