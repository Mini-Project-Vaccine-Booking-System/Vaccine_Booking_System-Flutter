import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vaccine/models/hospital.dart';
import 'package:vaccine/models/schedule.dart';
import 'package:vaccine/models/vaccine.dart';

import '../../../constants.dart';

class TopCard extends StatelessWidget {
  const TopCard(
      {Key? key,
      required this.size,
      required this.dataHospital,
      required this.dataVaccine,
      required this.dataSchedule})
      : super(key: key);

  final Size size;
  final Hospital? dataHospital;
  final Vaccine? dataVaccine;
  final Schedule? dataSchedule;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.05, vertical: size.width * 0.05),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
              spreadRadius: 2,
              blurRadius: 5,
              color: Colors.black.withOpacity(0.2),
              offset: Offset(0, 1)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    image: DecorationImage(
                        image: AssetImage("assets/images/rs.png"),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                width: size.width * 0.03,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: size.width * 0.5),
                    child: Text(
                      dataHospital!.name,
                      style: paragraphBold1(cMainBlack),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: size.width * 0.5),
                    child: Text(
                      dataHospital!.address,
                      style: paragraphRegular3(cMainBlack),
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: size.height * 0.01),
          Divider(
            thickness: 2,
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Jenis Vaksin",
                ),
                Text(
                  dataVaccine!.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Divider(
            thickness: 2,
          ),
          SizedBox(height: size.height * 0.01),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tanggal",
                    ),
                    Text(
                      DateFormat('EEEE, d MMMM y')
                          .format(DateTime.parse(dataSchedule!.start))
                          .toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  width: size.width * 0.07,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Waktu",
                    ),
                    Text(
                      "${DateFormat.Hm().format(DateTime.parse(dataSchedule!.start)).toString()} - ${DateFormat.Hm().format(DateTime.parse(dataSchedule!.end)).toString()}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
