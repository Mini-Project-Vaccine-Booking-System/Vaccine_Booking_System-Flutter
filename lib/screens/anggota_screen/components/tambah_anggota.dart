import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

import '../../../components/roundedButtonSolid.dart';
import '../../../components/roundedContainer.dart';
import '../../../constants.dart';
import '../../../view_model/family_view_mode.dart';

class TambahAnggota extends StatelessWidget {
  const TambahAnggota({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    var family = Provider.of<FamilyViewModel>(context);
    final _formKey = GlobalKey<FormBuilderState>();
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: FormBuilder(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.03,
            ),
            Text(
              "Nama Lengkap",
              style: paragraphMedium2(cMainBlack),
            ),
            roundedContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: FormBuilderTextField(
                  name: "name",
                  decoration: InputDecoration(
                    hintText: "ketik nama lengkap disini",
                    hintStyle: paragraphRegular1(cNeutral1),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Text(
              "NIK",
              style: paragraphMedium2(cMainBlack),
            ),
            roundedContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: FormBuilderTextField(
                  name: "nik",
                  decoration: InputDecoration(
                    hintText: "ketik nama lengkap disini",
                    hintStyle: paragraphRegular1(cNeutral1),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Text(
              "Usia",
              style: paragraphMedium2(cMainBlack),
            ),
            roundedContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: FormBuilderTextField(
                  name: "usia",
                  decoration: InputDecoration(
                    hintText: "ketika usia disini",
                    hintStyle: paragraphRegular1(cNeutral1),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Text(
              "No. Handphone",
              style: paragraphMedium2(cMainBlack),
            ),
            roundedContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: FormBuilderTextField(
                  name: "phone",
                  decoration: InputDecoration(
                    hintText: "ketik no handphone disini",
                    hintStyle: paragraphRegular1(cNeutral1),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Text(
              "Jenis Kelamin",
              style: paragraphMedium2(cMainBlack),
            ),
            roundedContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: FormBuilderTextField(
                  name: "gender",
                  decoration: InputDecoration(
                    hintText: "ketik jenis kelamin disini",
                    hintStyle: paragraphRegular1(cNeutral1),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            RoundedButtonSolid(
                size: size,
                text: "Simpan",
                onAction: () {
                  _formKey.currentState!.save();
                  if (_formKey.currentState!.validate()) {
                    family.addMember(
                        _formKey.currentState!.value["name"],
                        _formKey.currentState!.value["nik"],
                        _formKey.currentState!.value["usia"],
                        _formKey.currentState!.value["phone"],
                        _formKey.currentState!.value["gender"]);
                  }
                })
          ],
        ),
      ),
    );
  }
}
