import 'package:flutter/material.dart';
import '../../../bindings/package_binding.dart';
import '../../../bindings/component_binding.dart';
import '../../constants.dart';
import '../../../bindings/view_model_binding.dart';
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

    return const Body();
  }
}
