import 'package:flutter/material.dart';
import '../../../bindings/model_binding.dart';

class MiddleCard extends StatelessWidget {
  const MiddleCard({Key? key, required this.size, required this.dataUser})
      : super(key: key);

  final Size size;
  final Family? dataUser;

  @override
  Widget build(BuildContext context) {
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                dataUser!.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
          const Divider(
            thickness: 2,
          ),
          SizedBox(height: size.height * 0.01),
          Text(
            "NIK : ${dataUser!.nik}",
          ),
        ],
      ),
    );
  }
}
