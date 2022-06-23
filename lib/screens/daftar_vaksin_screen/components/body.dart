import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import 'package:vaccine/components/roundedButtonLoading.dart';
import 'package:vaccine/screens/result_faskes_screen/result_faskes_screen.dart';
import 'package:vaccine/view_model/hospital_view_model.dart';

import '../../../components/roundedButtonSolid.dart';
import '../../../components/roundedContainer.dart';
import '../../../constants.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    var hospital = Provider.of<HospitalViewModel>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    final _formKey = GlobalKey<FormBuilderState>();
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.03,
          ),
          Center(child: Image.asset("assets/icons/icon.png")),
          SizedBox(
            height: size.height * 0.03,
          ),
          Text(
            "Lindungi diri dan sekitar dengan vaksinasi COVID-19",
            style: paragraphSemiBold1(cMainBlack),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Text(
            "Lakukan vaksin dengan mudah dan cepat dari lokasi terdekat",
            style: paragraphMedium3(cNeutral3),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Text(
            "Cari lokasi vaksin",
            style: paragraphMedium2(cMainBlack),
          ),
          FormBuilder(
              key: _formKey,
              child: Column(
                children: [
                  roundedContainer(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.05),
                      child: FormBuilderTextField(
                        name: "city",
                        decoration: InputDecoration(
                          hintText: "e.g Jakarta",
                          hintStyle: paragraphRegular1(cNeutral1),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  isLoading != true
                      ? RoundedButtonSolid(
                          size: size,
                          text: "Cari",
                          onAction: () {
                            setState(() {
                              isLoading = !isLoading;
                            });
                            _formKey.currentState!.save();
                            if (_formKey.currentState!.validate()) {
                              hospital
                                  .getDataByCity(
                                      _formKey.currentState!.value["city"])
                                  .then((value) {
                                setState(() {
                                  isLoading = !isLoading;
                                });
                                if (value == true) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              ResultFaskesScreen()));
                                } else {
                                  print(value);
                                }
                              });
                            }
                          },
                        )
                      : RoundedButtonLoading(size: size)
                ],
              )),
        ],
      ),
    );
  }
}
