import 'package:flutter/material.dart';
import '../../../bindings/package_binding.dart';
import '../../../bindings/view_model_binding.dart';
import '../../../constants.dart';

class TopCard extends StatelessWidget {
  const TopCard({Key? key, required this.size}) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    var hospital = Provider.of<HospitalViewModel>(context);
    var family = Provider.of<FamilyViewModel>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.05, vertical: size.width * 0.05),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
              spreadRadius: 2,
              blurRadius: 5,
              color: Colors.black.withOpacity(0.2),
              offset: const Offset(0, 1)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
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
                      hospital.dataSelect.name,
                      style: paragraphBold1(cMainBlack),
                      textAlign: TextAlign.start,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: size.width * 0.5),
                    child: Text(
                      hospital.dataSelect.address,
                      style: paragraphRegular3(cMainBlack),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
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
                "Jenis Vaksin",
              ),
              Text(
                hospital.dataSelect.vaccine,
                style: const TextStyle(fontWeight: FontWeight.bold),
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
                  ),
                  Text(
                    DateFormat("EEEE, dd MMMM yyyy")
                        .format(hospital.dataSelect.date)
                        .toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
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
                  ),
                  Text(
                    "${hospital.dataSelect.start.substring(0, 5)} - ${hospital.dataSelect.end.substring(0, 5)}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
          SizedBox(height: size.height * 0.01),
        ],
      ),
    );
  }
}
