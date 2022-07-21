import 'package:flutter/material.dart';
import '../../../bindings/package_binding.dart';
import '../../../bindings/view_model_binding.dart';
import '../../../bindings/component_binding.dart';
import 'components/body.dart';
import '../../constants.dart';

class HistoryTicketScreen extends StatelessWidget {
  const HistoryTicketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var ticket = Provider.of<TicketViewModel>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: TopBar(context, size, "Tiket Vaksin"), body: body(ticket));
  }

  Widget body(TicketViewModel viewModel) {
    final isLoading = viewModel.state == TicketViewState.loading;
    final isError = viewModel.state == TicketViewState.error;

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
