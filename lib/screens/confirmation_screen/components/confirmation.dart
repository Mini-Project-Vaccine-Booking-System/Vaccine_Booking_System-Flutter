import 'package:flutter/material.dart';
import '../../../bindings/package_binding.dart';
import '../../../bindings/view_model_binding.dart';
import '../../../constants.dart';

class Confirmation extends StatelessWidget {
  const Confirmation({Key? key, required this.size}) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    var hospital = Provider.of<HospitalViewModel>(context);
    var family = Provider.of<FamilyViewModel>(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: size.width * 0.5),
              child: Text(
                hospital.dataSelect.name,
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        color: cMainBlack,
                        fontSize: 15,
                        fontWeight: FontWeight.w700)),
                textAlign: TextAlign.start,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: size.width * 0.5),
              child: Text(
                hospital.dataSelect.address,
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        color: cMainBlack,
                        fontSize: 11,
                        fontWeight: FontWeight.w400)),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        SizedBox(height: size.height * 0.01),
        const Divider(
          thickness: 2,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Jenis Vaksin",
              style: TextStyle(fontSize: 14),
            ),
            Text(
              hospital.dataSelect.vaccine,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            )
          ],
        ),
        const Divider(
          thickness: 2,
        ),
        SizedBox(height: size.height * 0.01),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Tanggal",
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  DateFormat("E, dd MMMM yyyy")
                      .format(hospital.dataSelect.date)
                      .toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 12),
                )
              ],
            ),
            SizedBox(
              width: size.width * 0.07,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Waktu",
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  "${hospital.dataSelect.start.substring(0, 5)} - ${hospital.dataSelect.end.substring(0, 5)}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 12),
                )
              ],
            )
          ],
        ),
        SizedBox(height: size.height * 0.01),
        const Divider(
          thickness: 2,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Pasien",
              style: TextStyle(fontSize: 14),
            ),
            if (family.dataSelect != null) ...[
              Text(
                family.dataSelect!.name,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ] else ...[
              const Text(
                "Pasien belum ditambahkan",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              )
            ],
          ],
        ),
        if (family.dataSelect != null) ...[
          SizedBox(height: size.height * 0.01),
          const Divider(
            thickness: 2,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "NIK",
                style: TextStyle(fontSize: 14),
              ),
              Text(
                family.dataSelect!.nik,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              )
            ],
          ),
        ],
      ],
    );
  }
}
