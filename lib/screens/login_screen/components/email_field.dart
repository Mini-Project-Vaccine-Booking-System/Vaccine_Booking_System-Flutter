import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:validators/validators.dart';

import '../../../components/roundedContainer.dart';
import '../../../constants.dart';

class EmailText extends StatefulWidget {
  const EmailText({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<EmailText> createState() => _EmailTextState();
}

class _EmailTextState extends State<EmailText> {
  bool? status;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.size.width * 0.05),
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
              keyboardType: TextInputType.emailAddress,
              name: "email",
              cursorColor: cPrimary1,
              onChanged: (value) {
                if (isEmail(value!)) {
                  setState(() {
                    status = true;
                  });
                } else {
                  setState(() {
                    status = false;
                  });
                }
              },
              decoration: status != null
                  ? InputDecoration(
                      hintText: "youareemail@gmail.com",
                      hintStyle: paragraphRegular1(cNeutral1),
                      border: InputBorder.none,
                      prefixIcon: status != true
                          ? const Tooltip(
                              message: "Password minimal panjang 8 karakter",
                              triggerMode: TooltipTriggerMode.tap,
                              child: Icon(
                                Icons.error_rounded,
                                color: cFail,
                              ),
                            )
                          : Icon(
                              Icons.email_outlined,
                              color: cNeutral1,
                            ),
                    )
                  : InputDecoration(
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
