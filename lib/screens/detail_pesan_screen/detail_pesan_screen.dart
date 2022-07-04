// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:vaccine/components/roundedButtonSolid.dart';
// import 'package:vaccine/screens/detail_pesan_screen/components/body.dart';

// import '../../constants.dart';
// import '../../view_model/hospital_view_model.dart';
// import '../../view_model/ticket_view_model.dart';
// import '../confirmation_screen/confirmation_scree.dart';

// class DetailPesanScreen extends StatelessWidget {
//   const DetailPesanScreen({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     var ticket = Provider.of<TicketViewModel>(context);
//     Size size = MediaQuery.of(context).size;
//     var hospital = Provider.of<HospitalViewModel>(context);
//     return Scaffold(
//       appBar: TopBar(context, size, "Detail Pemesanan"),
//       /*   appBar: AppBar(
//         shape: const Border(bottom: BorderSide(color: cNeutral2, width: 1)),
//         leadingWidth: 50,
//         leading: IconButton(
//             padding: const EdgeInsets.all(0.0),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: const Icon(
//               Icons.arrow_back_rounded,
//               size: 24,
//               color: cMainWhite,
//             )),
//         backgroundColor: cPrimary1,
//         elevation: 0.0,
//         title: const Text(
//           "Detail",
//           style: TextStyle(
//               color: cMainWhite, fontSize: 17, fontWeight: FontWeight.bold),
//         ),
//         centerTitle: false,
//       ), */
//       body: Body(),
//       bottomSheet: Container(
//         width: size.width,
//         height: 70,
//         decoration: BoxDecoration(
//           color: Theme.of(context).scaffoldBackgroundColor,
//           boxShadow: [
//             BoxShadow(
//                 spreadRadius: 2,
//                 blurRadius: 2,
//                 color: Colors.black.withOpacity(0.2),
//                 offset: Offset(0, 1)),
//           ],
//         ),
//         child: Padding(
//           padding:
//               EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: 10),
//           child: RoundedButtonSolid(
//               size: size,
//               text: "Pesan",
//               onAction: () {
//                 if (ticket.scheduleSelect != null &&
//                     ticket.scheduleSelect != null &&
//                     ticket.vaccineSelect != null) {
//                   ticket.setHospitalSelect = hospital.dataSelect;
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (_) => const ConfirmationScreen()));
//                 } else {
//                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                     content: const Text("Data pendaftaran tidak lengkap!"),
//                     backgroundColor: cFail,
//                     behavior: SnackBarBehavior.floating,
//                     action: SnackBarAction(
//                       label: "Abaikan",
//                       onPressed: () {},
//                       textColor: Colors.white,
//                     ),
//                   ));
//                 }
//               }),
//         ),
//       ),
//     );
//   }
// }
