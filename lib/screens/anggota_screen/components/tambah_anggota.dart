import 'package:flutter/material.dart';
import '../../anggota_screen/anggota_screen.dart';
import '../../../bindings/package_binding.dart';
import '../../../bindings/component_binding.dart';
import '../../../bindings/view_model_binding.dart';
import '../../../constants.dart';

class TambahAnggota extends StatefulWidget {
  const TambahAnggota({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<TambahAnggota> createState() => _TambahAnggotaState();
}

class _TambahAnggotaState extends State<TambahAnggota> {
  List gender = ["Laki-Laki", "Perempuan"];
  final _formKey = GlobalKey<FormBuilderState>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    var family = Provider.of<FamilyViewModel>(context);
    return SingleChildScrollView(
      child: FormBuilder(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nama Lengkap",
              style: paragraphMedium2(cMainBlack),
            ),
            RoundedContainer(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: widget.size.width * 0.05),
                child: FormBuilderTextField(
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.name,
                  name: "username",
                  decoration: InputDecoration(
                    hintText: "ketik nama lengkap disini",
                    hintStyle: paragraphRegular1(cNeutral1),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: widget.size.height * 0.02,
            ),
            Text(
              "NIK",
              style: paragraphMedium2(cMainBlack),
            ),
            RoundedContainer(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: widget.size.width * 0.05),
                child: FormBuilderTextField(
                  textCapitalization: TextCapitalization.none,
                  keyboardType: TextInputType.number,
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
              height: widget.size.height * 0.02,
            ),
            Text(
              "Tanggal Lahir",
              style: paragraphMedium2(cMainBlack),
            ),
            RoundedContainer(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: widget.size.width * 0.05),
                child: FormBuilderDateTimePicker(
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
              height: widget.size.height * 0.02,
            ),
            Text(
              "No. Handphone",
              style: paragraphMedium2(cMainBlack),
            ),
            RoundedContainer(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: widget.size.width * 0.05),
                child: FormBuilderTextField(
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
              height: widget.size.height * 0.02,
            ),
            Text(
              "Jenis Kelamin",
              style: paragraphMedium2(cMainBlack),
            ),
            RoundedContainer(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: widget.size.width * 0.05),
                child: FormBuilderDropdown(
                  decoration: const InputDecoration(border: InputBorder.none),
                  name: 'gender',
                  allowClear: true,
                  hint: const Text('Jenis Kelamin'),
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
              height: widget.size.height * 0.05,
            ),
            isLoading != true
                ? RoundedButtonSolid(
                    size: widget.size,
                    text: "Simpan",
                    onAction: () {
                      setState(() {
                        isLoading = !isLoading;
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
                              .addMember(
                                  _formKey.currentState!.value["username"],
                                  _formKey.currentState!.value["nik"],
                                  _formKey.currentState!.value["date"],
                                  _formKey.currentState!.value["phone"],
                                  _formKey.currentState!.value["gender"])
                              .then((value) {
                            setState(() {
                              isLoading = !isLoading;
                            });

                            if (value == true) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const AnggotaScreen(
                                            currentIndex: 1,
                                          )));

                              showSuccess(
                                  const Text("Data berhasil ditambahkan!"),
                                  context);
                            } else {
                              showError(
                                  const Text("Kesalahan server!"), context);
                            }
                          });
                        } else {
                          setState(() {
                            isLoading = !isLoading;
                          });
                          showError(
                              const Text(
                                  "Pastikan semua input terisi dengan benar, dan NIK memiliki 16 karakter angka"),
                              context);
                        }
                      }
                    })
                : RoundedButtonLoading(size: widget.size),
            SizedBox(
              height: widget.size.height * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}
