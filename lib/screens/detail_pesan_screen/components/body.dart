import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaccine/models/family.dart';
import 'package:vaccine/screens/confirmation_screen/confirmation_scree.dart';

import '../../../components/roundedButtonSolid.dart';
import '../../../components/roundedContainer.dart';
import '../../../constants.dart';
import '../../../view_model/family_view_model.dart';
import '../../../view_model/hospital_view_model.dart';
import '../../../view_model/ticket_view_model.dart';
import 'jenis_vaksin.dart';
import 'sesi_vaksin.dart';
import 'tanggal_vaksin.dart';
import 'top_card.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isInit = true;

  @override
  void didChangeDependencies() {
    if (isInit == true) {
      Provider.of<FamilyViewModel>(context, listen: false).getAllData();
      isInit = false;
    }
    super.didChangeDependencies();
  }

  Family? dropdownvalue;
  @override
  Widget build(BuildContext context) {
    var family = Provider.of<FamilyViewModel>(context);
    var ticket = Provider.of<TicketViewModel>(context);
    var hospital = Provider.of<HospitalViewModel>(context);
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.03,
          ),
          TopCard(
            size: size,
            nama: hospital.dataSelect.name,
            alamat: hospital.dataSelect.address,
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
          Text(
            "Pilih jadwal vaksin",
            style: paragraphSemiBold3(cMainBlack),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          TanggalVaksin(
            size: size,
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Text(
            "Pilih jenis vaksin",
            style: paragraphSemiBold3(cMainBlack),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          JenisVaksin(size: size),
          // SizedBox(
          //   height: size.height * 0.03,
          // ),
          // Text(
          //   "Pilih sesi vaksin",
          //   style: paragraphSemiBold3(cMainBlack),
          // ),
          // SizedBox(
          //   height: size.height * 0.01,
          // ),
          // SesiVaksin(size: size),
          SizedBox(
            height: size.height * 0.03,
          ),
          Text(
            "Pesan tiket untuk",
            style: paragraphSemiBold3(cMainBlack),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          roundedContainer(
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                hint: const Text("Silahkan pilih anggota"),
                value: dropdownvalue == null
                    ? null
                    : family.allData.firstWhere(
                        (element) => element.name == dropdownvalue!.name),
                isExpanded: true,
                iconSize: 36,
                icon: const Icon(Icons.keyboard_arrow_down_rounded),
                items: family.allData.map((items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items.name),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    dropdownvalue = newValue as Family?;
                  });
                },
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          RoundedButtonSolid(
            size: size,
            text: "Pesan",
            onAction: () {
              if (hospital.dataSelect != null &&
                  hospital.scheduleSelect != null &&
                  hospital.vaccineSelect != null &&
                  dropdownvalue != null) {
                ticket.setHospitalSelect = hospital.dataSelect;
                ticket.setScheduleSelect = hospital.scheduleSelect;
                ticket.setVaccineSelect = hospital.vaccineSelect;
                ticket.setUserSelect = dropdownvalue;
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => ConfirmationScreen()));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Data pendaftaran tidak lengkap!"),
                  backgroundColor: cFail,
                ));
              }
            },
          ),
          SizedBox(
            height: size.height * 0.03,
          )
        ],
      ),
    );
  }
}
