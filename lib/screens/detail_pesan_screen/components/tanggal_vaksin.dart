// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';

// import '../../../constants.dart';
// import '../../../view_model/hospital_view_model.dart';
// import '../../../view_model/ticket_view_model.dart';

// class TanggalVaksin extends StatefulWidget {
//   const TanggalVaksin({Key? key, required this.size}) : super(key: key);

//   final Size size;

//   @override
//   State<TanggalVaksin> createState() => _TanggalVaksinState();
// }

// class _TanggalVaksinState extends State<TanggalVaksin> {
//   int? indexActive;
//   bool isLoading = false;

//   @override
//   Widget build(BuildContext context) {
//     var hospital = Provider.of<HospitalViewModel>(context);
//     var ticket = Provider.of<TicketViewModel>(context);
//     return SizedBox(
//       height: widget.size.height * 0.15,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: hospital.dataDate.length,
//         itemBuilder: (context, index) {
//           return InkWell(
//               onTap: () {
//                 // hospital.scheduleSelect = hospital.dataDate[index];
//                 hospital.getVaccine(hospital.dataDate[index].id);
//                 setState(() {
//                   indexActive = index;
//                 });
//                 ticket.setScheduleSelect = hospital.dataDate[index];
//               },
//               child: Container(
//                   margin: EdgeInsets.all(5),
//                   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(10)),
//                     color: indexActive == index ? cPrimary1 : cMainWhite,
//                     border: Border.all(color: cPrimary1),
//                     boxShadow: [
//                       BoxShadow(
//                           spreadRadius: 2,
//                           blurRadius: 5,
//                           color: Colors.grey.withOpacity(0.4),
//                           offset: Offset(0, 1)),
//                     ],
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Text(
//                             DateFormat('dd')
//                                 .format(DateTime.parse(
//                                     hospital.dataDate[index].start))
//                                 .toString(),
//                             style: TextStyle(
//                                 color: indexActive == index
//                                     ? Colors.white
//                                     : cPrimary1,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 40),
//                           ),
//                           SizedBox(
//                             width: 6,
//                           ),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 DateFormat('E')
//                                     .format(DateTime.parse(
//                                         hospital.dataDate[index].start))
//                                     .toString(),
//                                 style: TextStyle(
//                                     color: indexActive == index
//                                         ? Colors.white
//                                         : cPrimary1,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 16),
//                               ),
//                               Text(
//                                 DateFormat('MMMM')
//                                     .format(DateTime.parse(
//                                         hospital.dataDate[index].start))
//                                     .toString(),
//                                 style: TextStyle(
//                                     fontSize: 16,
//                                     color: indexActive == index
//                                         ? Colors.white
//                                         : cPrimary1),
//                               )
//                             ],
//                           )
//                         ],
//                       ),
//                       Center(
//                         child: Text(
//                           "${DateFormat.Hm().format(DateTime.parse(hospital.dataDate[index].start)).toString()} - ${DateFormat.Hm().format(DateTime.parse(hospital.dataDate[index].end)).toString()}",
//                           style: paragraphRegular2(
//                               indexActive == index ? Colors.white : cPrimary1),
//                         ),
//                       ),
//                     ],
//                   )));
//         },
//       ),
//     );
//   }
// }
