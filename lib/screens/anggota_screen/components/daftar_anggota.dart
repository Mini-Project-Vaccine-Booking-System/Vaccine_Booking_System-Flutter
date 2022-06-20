import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaccine/screens/edit_anggota/edit_anggota.dart';
import 'package:vaccine/view_model/family_view_mode.dart';

import '../../../constants.dart';

class DaftarAnggota extends StatelessWidget {
  const DaftarAnggota({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    var family = Provider.of<FamilyViewModel>(context);
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.02,
          ),
          family.data.isEmpty
              ? Text("Data tidak tersedia")
              : SizedBox(
                  height: size.height,
                  child: ListView.separated(
                    itemBuilder: ((context, index) {
                      return InkWell(
                        onTap: () {
                          /* Navigator.push(context,
                        MaterialPageRoute(builder: (_) => EditAnggota())); */
                        },
                        child: ListTile(
                            dense: true,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 0.0, vertical: 0.0),
                            visualDensity:
                                VisualDensity(horizontal: 0, vertical: -4),
                            title: Text(
                              family.data[index].name,
                              style: paragraphSemiBold1(Colors.black),
                            ),
                            subtitle: Text(
                              family.data[index].nik,
                              style: paragraphMedium4(cNeutral3),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios_rounded)),
                      );
                    }),
                    separatorBuilder: (context, index) {
                      return Divider(
                        thickness: 2,
                      );
                    },
                    itemCount: family.data.length,
                  ),
                ),
        ],
      ),
    );
  }
}
