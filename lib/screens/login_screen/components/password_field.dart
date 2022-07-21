import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:validators/validators.dart';

import '../../../components/roundedContainer.dart';
import '../../../constants.dart';

class PasswordText extends StatefulWidget {
  const PasswordText({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<PasswordText> createState() => _PasswordTextState();
}

class _PasswordTextState extends State<PasswordText> {
  bool? isValidPassword;
  bool showPassword = true;
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
            "Password",
            style: paragraphMedium2(cMainBlack),
          ),
          RoundedContainer(
            child: FormBuilderTextField(
              keyboardType: TextInputType.visiblePassword,
              onChanged: (value) {
                if (isLength(value!, 8)) {
                  setState(() {
                    isValidPassword = true;
                  });
                } else {
                  setState(() {
                    isValidPassword = false;
                  });
                }
              },
              cursorColor: cPrimary1,
              obscureText: showPassword,
              name: "password",
              decoration: isValidPassword != null
                  ? InputDecoration(
                      hintText: "ketik password disini",
                      hintStyle: paragraphRegular1(cNeutral1),
                      border: InputBorder.none,
                      prefixIcon: isValidPassword != true
                          ? const Tooltip(
                              message: "Password minimal panjang 8 karakter",
                              triggerMode: TooltipTriggerMode.tap,
                              child: Icon(
                                Icons.error_rounded,
                                color: cFail,
                              ),
                            )
                          : const Icon(
                              Icons.lock_outline_rounded,
                              color: cNeutral1,
                            ),
                      suffixIcon: Tooltip(
                        message: "Password minimal panjang 8 karakter",
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                showPassword = !showPassword;
                              });
                            },
                            icon: showPassword != true
                                ? const Icon(
                                    Icons.visibility_off,
                                    color: cPrimary1,
                                  )
                                : const Icon(
                                    Icons.visibility,
                                    color: cPrimary1,
                                  )),
                      ))
                  : InputDecoration(
                      hintText: "ketik password disini",
                      hintStyle: paragraphRegular1(cNeutral1),
                      border: InputBorder.none,
                      prefixIcon: const Icon(
                        Icons.lock_outline_rounded,
                        color: cNeutral1,
                      ),
                      suffixIcon: Tooltip(
                        message: "Password minimal panjang 8 karakter",
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                showPassword = !showPassword;
                              });
                            },
                            icon: showPassword != true
                                ? const Icon(
                                    Icons.visibility_off,
                                    color: cPrimary1,
                                  )
                                : const Icon(
                                    Icons.visibility,
                                    color: cPrimary1,
                                  )),
                      )),
            ),
          )
        ],
      ),
    );
  }
}
