import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../view_model/hospital_view_model.dart';

class JenisVaksin extends StatefulWidget {
  const JenisVaksin({Key? key, required this.size}) : super(key: key);

  final Size size;

  @override
  State<JenisVaksin> createState() => _JenisVaksinState();
}

class _JenisVaksinState extends State<JenisVaksin> {
  int? indexActive;
  @override
  Widget build(BuildContext context) {
    var hospital = Provider.of<HospitalViewModel>(context);
    return hospital.dataVaccine.isNotEmpty
        ? SizedBox(
            height: widget.size.height * 0.06,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: hospital.dataVaccine.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    hospital.vaccineSelect = hospital.dataVaccine[index];
                    setState(() {
                      indexActive = index;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: indexActive == index ? cPrimary1 : cMainWhite,
                      border: Border.all(color: cPrimary1),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 1,
                            blurRadius: 5,
                            color: Colors.grey.withOpacity(0.4),
                            offset: Offset(0, 1)),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        hospital.dataVaccine[index].name,
                        style: paragraphLight2(
                            indexActive == index ? Colors.white : cPrimary1),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        : Text(
            "Silahkan pilih jadwal, untuk menampilkan ketersediaan vaksin",
            style: paragraphLight2(cPrimary1),
          );
  }
}
