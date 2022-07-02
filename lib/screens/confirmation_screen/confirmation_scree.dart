import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaccine/screens/confirmation_screen/components/body.dart';

import '../../components/roundedButtonLoading.dart';
import '../../components/roundedButtonSolid.dart';
import '../../constants.dart';
import '../../view_model/ticket_view_model.dart';
import '../pass_screen/pass_screen.dart';

class ConfirmationScreen extends StatefulWidget {
  const ConfirmationScreen({Key? key}) : super(key: key);

  @override
  State<ConfirmationScreen> createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var ticket = Provider.of<TicketViewModel>(context);
    return Scaffold(
      appBar: TopBar(context, size, "Konfirmasi"),
      /*   appBar: AppBar(
        shape: const Border(bottom: BorderSide(color: cNeutral2, width: 1)),
        leadingWidth: 50,
        leading: IconButton(
            padding: const EdgeInsets.all(0.0),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_rounded,
              size: 24,
              color: cMainWhite,
            )),
        backgroundColor: cPrimary1,
        elevation: 0.0,
        title: const Text(
          "Konfirmasi Pesanan",
          style: TextStyle(
              color: cMainWhite, fontSize: 17, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ), */
      body: Body(),
      bottomSheet: Container(
        width: size.width,
        height: 70,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
                spreadRadius: 2,
                blurRadius: 2,
                color: Colors.black.withOpacity(0.2),
                offset: Offset(0, 1)),
          ],
        ),
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: 10),
          child: isLoading == false
              ? RoundedButtonSolid(
                  size: size,
                  text: "Konfirmasi",
                  onAction: () {
                    setState(() {
                      isLoading = !isLoading;
                    });
                    ticket
                        .saveTicket(
                            family_id: ticket.userSelect!.id,
                            vaccine_id: ticket.vaccineSelect!.id,
                            shcedule_id: ticket.scheduleSelect!.id,
                            hospital_id: ticket.hospitalSelect!.id)
                        .then((value) {
                      setState(() {
                        isLoading = !isLoading;
                      });

                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => PassScreen()),
                          (route) => false);
                    });
                  })
              : RoundedButtonLoading(size: size),
        ),
      ),
    );
  }
}
