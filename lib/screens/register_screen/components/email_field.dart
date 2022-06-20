import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../components/roundedContainer.dart';
import '../../../constants.dart';

class EmailText extends StatelessWidget {
  const EmailText({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Email",
            style: paragraphMedium2(cMainBlack),
          ),
          roundedContainer(
            child: FormBuilderTextField(
              name: "email",
              decoration: InputDecoration(
                hintText: "youareemail@gmail.com",
                hintStyle: paragraphRegular1(cNeutral1),
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: cNeutral1,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
