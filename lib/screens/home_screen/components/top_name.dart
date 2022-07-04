import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaccine/screens/akun_screen/akun_screen.dart';

import '../../../constants.dart';
import '../../../view_model/account_view_model.dart';

class TopName extends StatelessWidget {
  const TopName({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    final account = Provider.of<AccoutnViewModel>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: "Halo, ",
                    style: headingBold2(Colors.black),
                  ),
                  TextSpan(
                    text: account.data != null ? account.data!.nama : "",
                    style: headingBold2(Colors.black),
                  ),
                ]),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.location_on_rounded,
                    color: cPrimaryG,
                    size: 16,
                  ),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  Text(
                    "Surakarta, Jawa Tengah",
                    style: paragraphMedium2(cNeutral1),
                  )
                ],
              )
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => Akun()));
          },
          child: Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/images/avatar.png")),
              )),
        )
      ],
    );
  }
}
