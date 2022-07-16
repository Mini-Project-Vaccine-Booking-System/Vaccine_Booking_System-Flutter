import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:validators/validators.dart';

import '../../../components/roundedContainer.dart';
import '../../../constants.dart';

class EmailText extends StatefulWidget {
  const EmailText({Key? key}) : super(key: key);

  @override
  State<EmailText> createState() => _EmailTextState();
}

class _EmailTextState extends State<EmailText> {
  bool? status;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
          RoundedContainer(
            child: FormBuilderTextField(
              name: "email",
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
              keyboardType: TextInputType.emailAddress,
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
                          : const Icon(
                              Icons.email_outlined,
                              color: cNeutral1,
                            ),
                    )
                  : InputDecoration(
                      hintText: "youareemail@gmail.com",
                      hintStyle: paragraphRegular1(cNeutral1),
                      border: InputBorder.none,
                      prefixIcon: const Icon(
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
