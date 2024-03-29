import 'package:flutter/material.dart';
import '../../../bindings/package_binding.dart';
import '../../../bindings/component_binding.dart';
import '../../../screens/result_faskes_screen/result_faskes_screen.dart';
import '../../../bindings/view_model_binding.dart';
import '../../../constants.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isLoading = false;
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    var hospital = Provider.of<HospitalViewModel>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          FormBuilder(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Cari lokasi vaksin",
                      style: paragraphMedium2(cMainBlack),
                    ),
                    RoundedContainer(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.05),
                        child: FormBuilderTextField(
                          name: "city",
                          textCapitalization: TextCapitalization.words,
                          decoration: InputDecoration(
                            hintText: "e.g Jakarta",
                            hintStyle: paragraphRegular1(cNeutral1),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Text(
                      "Tanggal vaksin",
                      style: paragraphMedium2(cMainBlack),
                    ),
                    RoundedContainer(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.05),
                        child: FormBuilderDateTimePicker(
                          firstDate: DateTime.now(),
                          format: DateFormat("EEEE, d MMMM yyyy"),
                          name: 'date',
                          inputType: InputType.date,
                          decoration: InputDecoration(
                            suffixIcon: const Icon(Icons.date_range),
                            hintText: "Sunday, 1 January 1945",
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
                                if (_formKey.currentState!.value["city"] !=
                                        null &&
                                    _formKey.currentState!.value["date"] !=
                                        null) {
                                  hospital
                                      .getDataByCity(
                                          _formKey.currentState!.value["city"],
                                          DateFormat("yyyy-MM-dd")
                                              .format(_formKey
                                                  .currentState!.value["date"])
                                              .toString())
                                      .then((value) {
                                    setState(() {
                                      isLoading = !isLoading;
                                    });
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => ResultFaskesScreen(
                                                  date: _formKey.currentState!
                                                      .value["date"],
                                                )));
                                  });
                                } else {
                                  setState(() {
                                    isLoading = !isLoading;
                                  });
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    backgroundColor: cFail,
                                    behavior: SnackBarBehavior.floating,
                                    content: const Text(
                                      "Input tidak valid!",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    action: SnackBarAction(
                                        label: 'Abaikan',
                                        textColor: Colors.white,
                                        onPressed: () {}),
                                  ));
                                }
                              } else {}
                            },
                          )
                        : RoundedButtonLoading(size: size)
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
