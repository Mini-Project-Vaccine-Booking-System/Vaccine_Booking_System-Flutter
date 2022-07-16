import 'package:flutter/material.dart';
import '../../../bindings/component_binding.dart';
import '../../../bindings/package_binding.dart';
import '../../../screens/edit_anggota/edit_anggota.dart';
import '../../../bindings/view_model_binding.dart';
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
      child: family.data.isEmpty
          ? const StateNull(
              text:
                  "Data anggota masih kosong, silahkan tambahkan kerabat anda.")
          : ListView.separated(
              shrinkWrap: true,
              itemBuilder: ((context, index) {
                return InkWell(
                  onTap: () {
                    family.dataSelect = family.data[index];
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const EditAnggota()));
                  },
                  child: ListTile(
                      dense: true,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 0.0, vertical: 0.0),
                      visualDensity:
                          const VisualDensity(horizontal: 0, vertical: -4),
                      title: Text(
                        family.data[index].name,
                        style: paragraphSemiBold1(Colors.black),
                      ),
                      subtitle: Text(
                        family.data[index].nik,
                        style: paragraphMedium4(cNeutral3),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios_rounded)),
                );
              }),
              separatorBuilder: (context, index) {
                return const Divider(
                  thickness: 2,
                );
              },
              itemCount: family.data.length,
            ),
    );
  }
}
