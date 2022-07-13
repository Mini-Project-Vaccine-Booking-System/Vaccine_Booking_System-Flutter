import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vaccine/components/roundedButtonLoading.dart';
import 'package:vaccine/screens/home_screen/home_screen.dart';
import 'package:validators/validators.dart';

import '../../../components/roundedButtonSolid.dart';
import '../../../components/roundedContainer.dart';
import '../../../constants.dart';
import '../../../view_model/auth_view_model.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String? dropdownvalue;
  XFile? pickedFile;
  UploadTask? uploadTask;
  String urlImage = "";

  Future<String> uploadFile() async {
    late String urlPhoto;
    if (pickedFile != null) {
      final path = 'files/${pickedFile!.name}';
      final file = File(pickedFile!.path);

      final ref = FirebaseStorage.instance.ref().child(path);
      setState(() {
        uploadTask = ref.putFile(file);
      });

      final snapshot = await uploadTask!.whenComplete(() {});

      final urlDownload = await snapshot.ref.getDownloadURL();
      print("Download LINK : $urlDownload");
      urlPhoto = urlDownload;

      setState(() {
        uploadTask = null;
      });
    }

    return urlImage = urlPhoto;
  }

  Future selectFile() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? result = await _picker.pickImage(source: ImageSource.gallery);
    /* FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['jpg', 'png']); */
    if (result == null) return;

    setState(() {
      pickedFile = result;
    });
  }

  List gender = ["Laki-Laki", "Perempuan"];
  bool isLoading = false;
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    var auth = Provider.of<AuthViewModel>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Column(children: [
        SizedBox(
          height: size.height * 0.03,
        ),
        Center(
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 15, right: 15, left: 15),
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: cMainWhite,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 2,
                        blurRadius: 10,
                        color: Colors.black.withOpacity(0.4),
                        offset: const Offset(0, 1)),
                  ],
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: pickedFile != null
                          ? FileImage(File(pickedFile!.path))
                          : const AssetImage("assets/images/user-avatar.png")
                              as ImageProvider),
                ),
              ),
              Positioned(
                  bottom: 2,
                  right: 2,
                  child: GestureDetector(
                    onTap: () async {
                      await selectFile();
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          shape: BoxShape.rectangle,
                          color: cPrimary1),
                      child: const Icon(
                        Icons.camera_alt_outlined,
                        color: cMainWhite,
                      ),
                    ),
                  )),
            ],
          ),
        ),
        FormBuilder(
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
              BuildTextField(
                capital: TextCapitalization.words,
                size: size,
                inputType: TextInputType.name,
                name: "username",
                hint: "ketik nama lengkap disini",
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                "NIK",
                style: paragraphMedium2(cMainBlack),
              ),
              BuildTextField(
                capital: TextCapitalization.none,
                size: size,
                inputType: TextInputType.number,
                name: "nik",
                hint: "ketik nik disini",
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                "Tanggal Lahir",
                style: paragraphMedium2(cMainBlack),
              ),
              roundedContainer(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
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
                height: size.height * 0.02,
              ),
              Text(
                "No. Handphone",
                style: paragraphMedium2(cMainBlack),
              ),
              BuildTextField(
                capital: TextCapitalization.none,
                size: size,
                inputType: TextInputType.phone,
                name: "phone",
                hint: "ketik no handphone disini",
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
                  child: FormBuilderDropdown(
                    decoration: const InputDecoration(border: InputBorder.none),
                    name: 'gender',
                    // initialValue: 'Male',
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
              // roundedContainer(
              //   child: Padding(
              //     padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
              //     child: DropdownButtonHideUnderline(
              //       child: DropdownButton(
              //         hint: const Text("Jenis kelamin"),
              //         value: dropdownvalue == null
              //             ? null
              //             : gender.firstWhere(
              //                 (element) => element == dropdownvalue!),
              //         isExpanded: true,
              //         iconSize: 36,
              //         icon: const Icon(Icons.keyboard_arrow_down_rounded),
              //         items: gender.map((items) {
              //           return DropdownMenuItem(
              //             value: items,
              //             child: Text(items),
              //           );
              //         }).toList(),
              //         onChanged: (newValue) {
              //           setState(() {
              //             dropdownvalue = newValue as String;
              //           });
              //         },
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: size.height * 0.05,
              ),
              isLoading != true
                  ? RoundedButtonSolid(
                      size: size,
                      text: "Simpan",
                      onAction: () async {
                        setState(() {
                          isLoading = !isLoading;
                        });
                        _formKey.currentState!.save();
                        if (_formKey.currentState!.validate()) {
                          if (_formKey.currentState!.value["username"] !=
                                  null &&
                              _formKey.currentState!.value["nik"] != null &&
                              isInt(_formKey.currentState!.value["nik"]) &&
                              isLength(_formKey.currentState!.value["nik"], 16,
                                  16) &&
                              _formKey.currentState!.value["date"] != null &&
                              _formKey.currentState!.value["phone"] != null &&
                              _formKey.currentState!.value["gender"] != null) {
                                
                            if (pickedFile != null) {
                              await uploadFile();
                            }

                            auth
                                .signUp(
                                    _formKey.currentState!.value["username"],
                                    _formKey.currentState!.value["nik"],
                                    _formKey.currentState!.value["date"],
                                    _formKey.currentState!.value["phone"],
                                    _formKey.currentState!.value["gender"],
                                    urlImage)
                                .then((value) {
                              setState(() {
                                isLoading = !isLoading;
                              });
                              // print(value);
                              if (value == true) {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => HomeScreen()),
                                    (route) => false);
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
                  : RoundedButtonLoading(size: size)
            ],
          ),
        ),
        SizedBox(
          height: size.height * 0.03,
        )
      ]),
    );
  }
}

class BuildTextField extends StatelessWidget {
  const BuildTextField(
      {Key? key,
      required this.size,
      required this.name,
      required this.inputType,
      required this.hint,
      required this.capital})
      : super(key: key);

  final Size size;
  final String name;
  final TextInputType inputType;
  final String hint;
  final TextCapitalization capital;

  @override
  Widget build(BuildContext context) {
    return roundedContainer(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        child: FormBuilderTextField(
          textCapitalization: capital,
          keyboardType: inputType,
          name: name,
          decoration: InputDecoration(
              hintText: hint,
              hintStyle: paragraphRegular1(cNeutral1),
              border: InputBorder.none),
        ),
      ),
    );
  }
}
