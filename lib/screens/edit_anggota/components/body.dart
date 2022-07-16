import 'package:flutter/material.dart';
import '../../../bindings/package_binding.dart';
import '../../../bindings/component_binding.dart';
import '../../../bindings/model_binding.dart';
import '../../../constants.dart';
import '../../../bindings/view_model_binding.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List gender = ["Laki-Laki", "Perempuan"];
  final _formKey = GlobalKey<FormBuilderState>();
  List<bool> isLoading = [false, false];

  @override
  Widget build(BuildContext context) {
    var family = Provider.of<FamilyViewModel>(context);
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: FormBuilder(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.02,
            ),
            Text(
              "Nama Lengkap",
              style: paragraphMedium2(cMainBlack),
            ),
            RoundedContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: FormBuilderTextField(
                  initialValue: family.dataSelect!.name,
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.name,
                  name: "username",
                  decoration: const InputDecoration(
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
            RoundedContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: FormBuilderTextField(
                  initialValue: family.dataSelect!.nik,
                  textCapitalization: TextCapitalization.none,
                  keyboardType: TextInputType.number,
                  name: "nik",
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Text(
              "Tanggal Lahir",
              style: paragraphMedium2(cMainBlack),
            ),
            RoundedContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: FormBuilderDateTimePicker(
                  initialValue: DateTime.parse(family.dataSelect!.tanggalLahir),
                  format: DateFormat("EEEE, d MMMM yyyy"),
                  name: 'date',
                  inputType: InputType.date,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.date_range),
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
            RoundedContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: FormBuilderTextField(
                  initialValue: family.dataSelect!.telp,
                  keyboardType: TextInputType.phone,
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
            RoundedContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: FormBuilderDropdown(
                  decoration: const InputDecoration(border: InputBorder.none),
                  name: 'gender',
                  initialValue: family.dataSelect!.gender,
                  allowClear: true,
                  items: gender
                      .map((gender) => DropdownMenuItem(
                            value: gender,
                            child: Text('$gender'),
                          ))
                      .toList(),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            isLoading[0] != true
                ? RoundedButtonSolid(
                    size: size,
                    text: "Simpan",
                    onAction: () {
                      setState(() {
                        isLoading[0] = !isLoading[0];
                      });
                      _formKey.currentState!.save();
                      if (_formKey.currentState!.validate()) {
                        if (_formKey.currentState!.value["username"] != null &&
                            _formKey.currentState!.value["nik"] != null &&
                            isInt(_formKey.currentState!.value["nik"]) &&
                            isLength(
                                _formKey.currentState!.value["nik"], 16, 16) &&
                            _formKey.currentState!.value["date"] != null &&
                            _formKey.currentState!.value["phone"] != null &&
                            _formKey.currentState!.value["gender"] != null) {
                          family
                              .updateFam(Family(
                                  id: family.dataSelect!.id,
                                  idParent: family.dataSelect!.idParent,
                                  name:
                                      _formKey.currentState!.value["username"],
                                  nik: _formKey.currentState!.value["nik"],
                                  tanggalLahir: (_formKey.currentState!
                                          .value["date"] as DateTime)
                                      .toIso8601String(),
                                  telp: _formKey.currentState!.value["phone"],
                                  gender:
                                      _formKey.currentState!.value["gender"],
                                  hubungan: family.dataSelect!.hubungan))
                              .then((value) {
                            setState(() {
                              isLoading[0] = !isLoading[0];
                            });

                            if (value == true) {
                              Navigator.pop(context);
                              showSuccess(const Text("Data berhasil disimpan!"),
                                  context);
                            } else {
                              showError(
                                  const Text("Kesalahan server!"), context);
                            }
                          });
                        } else {
                          setState(() {
                            isLoading[0] = !isLoading[0];
                          });
                          showError(
                              const Text(
                                  "Pastikan semua input terisi dengan benar, dan NIK memiliki 16 karakter angka"),
                              context);
                        }
                      }
                    })
                : RoundedButtonLoading(size: size),
            SizedBox(
              height: size.height * 0.02,
            ),
            isLoading[1] != true
                ? RoundedButtonDanger(
                    size: size,
                    text: "Hapus",
                    onAction: () {
                      setState(() {
                        isLoading[1] = !isLoading[1];
                      });
                      family.deleteData().then((value) {
                        setState(() {
                          isLoading[1] = !isLoading[1];
                        });

                        if (value == true) {
                          Navigator.pop(context);
                          showSuccess(
                              const Text("Data berhasil dihapus!"), context);
                        } else {
                          showError(const Text("Kesalahan server!"), context);
                        }
                      });
                    })
                : RoundedButtonLoadingDanger(size: size),
            SizedBox(
              height: size.height * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}
