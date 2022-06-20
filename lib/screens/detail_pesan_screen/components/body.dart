import 'package:flutter/material.dart';
import 'package:vaccine/screens/confirmation_screen/confirmation_scree.dart';

import '../../../components/roundedButtonSolid.dart';
import '../../../components/roundedContainer.dart';
import '../../../constants.dart';
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
  String dropdownvalue = 'Silahkan pilih';

  // List of items in our dropdown menu
  var items = [
    'Silahkan pilih',
    'Jerome Bell',
    'Jerome Bell',
    'Jerome Bell',
    'Jerome Bell',
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.03,
          ),
          TopCard(size: size),
          SizedBox(
            height: size.height * 0.04,
          ),
          Text(
            "Pilih tanggal vaksin",
            style: paragraphSemiBold3(cMainBlack),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          TanggalVaksin(size: size),
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
          SizedBox(
            height: size.height * 0.03,
          ),
          Text(
            "Pilih sesi vaksin",
            style: paragraphSemiBold3(cMainBlack),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          SesiVaksin(size: size),
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
                value: dropdownvalue,
                isExpanded: true,
                iconSize: 36,
                icon: const Icon(Icons.keyboard_arrow_down_rounded),
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => ConfirmationScreen()));
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
