import 'package:flutter/material.dart';
import '../../../bindings/package_binding.dart';
import '../../../bindings/view_model_binding.dart';
import '../../../constants.dart';

class DataAkun extends StatelessWidget {
  DataAkun({Key? key, required this.size}) : super(key: key);
  final Size size;
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final account = Provider.of<AccoutnViewModel>(context);
    print(account.userId);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              spreadRadius: 2,
              blurRadius: 10,
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0, 1)),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Nama Lengkap",
                style: paragraphSemiBold2(Colors.black),
              ),
              GestureDetector(
                onTap: () {
                  bottomModal(context, "nama", "Masukkan nama kamu",
                      account.data!.nama, _formKey, TextInputType.name);
                },
                child: Row(
                  children: [
                    Text(
                      account.data != null ? account.data!.nama : "",
                      style: paragraphRegular2(Colors.black),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 15,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
            ],
          ),
          const Divider(
            color: Colors.black,
            thickness: 0.5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "NIK",
                style: paragraphSemiBold2(Colors.black),
              ),
              GestureDetector(
                onTap: () {
                  bottomModal(context, "nik", "Masukkan NIK kamu",
                      account.data!.nik, _formKey, TextInputType.number);
                },
                child: Row(
                  children: [
                    Text(
                      account.data != null ? account.data!.nik : "",
                      style: paragraphRegular2(Colors.black),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 15,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
            ],
          ),
          const Divider(
            color: Colors.black,
            thickness: 0.5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Tanggal Lahir",
                style: paragraphSemiBold2(Colors.black),
              ),
              GestureDetector(
                onTap: () {
                  bottomModal(
                      context,
                      "tglLahir",
                      "Masukkan tanggal lahir kamu",
                      account.data!.tanggalLahir,
                      _formKey,
                      TextInputType.datetime);
                },
                child: Row(
                  children: [
                    Text(
                      account.data != null
                          ? DateFormat("dd-M-yyyy")
                              .format(
                                  DateTime.parse(account.data!.tanggalLahir))
                              .toString()
                          : "",
                      style: paragraphRegular2(Colors.black),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 15,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
            ],
          ),
          const Divider(
            color: Colors.black,
            thickness: 0.5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Telp",
                style: paragraphSemiBold2(Colors.black),
              ),
              GestureDetector(
                onTap: () {
                  bottomModal(context, "phone", "Masukkan no telp kamu",
                      account.data!.phone, _formKey, TextInputType.phone);
                },
                child: Row(
                  children: [
                    Text(
                      account.data != null ? account.data!.phone : "",
                      style: paragraphRegular2(Colors.black),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 15,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
            ],
          ),
          const Divider(
            color: Colors.black,
            thickness: 0.5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Email",
                style: paragraphSemiBold2(Colors.black),
              ),
              GestureDetector(
                onTap: () {
                  bottomModal(
                      context,
                      "email",
                      "Masukkan email kamu",
                      account.data!.email,
                      _formKey,
                      TextInputType.emailAddress);
                },
                child: Row(
                  children: [
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 100),
                      child: Text(
                        account.data != null ? account.data!.email : "",
                        style: paragraphRegular2(Colors.black),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 15,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
            ],
          ),
          const Divider(
            color: Colors.black,
            thickness: 0.5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Password",
                style: paragraphSemiBold2(Colors.black),
              ),
              GestureDetector(
                onTap: () {
                  bottomModal(context, "password", "Masukkan password kamu", "",
                      _formKey, TextInputType.text);
                },
                child: Row(
                  children: [
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 100),
                      child: Text(
                        "********",
                        style: paragraphRegular2(Colors.black),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 15,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<dynamic> bottomModal(
      BuildContext context, name, hint, initial, formKey, keyboardType) {
    return showModalBottomSheet(
        context: context,
        builder: (context) => Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: SizedBox(
                width: size.width,
                height: name == "password" ? 200 : 150,
                child: ListView(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.05, vertical: 15),
                    children: [
                      Text(
                        hint,
                        style: paragraphSemiBold2(Colors.black),
                      ),
                      FormBuilder(
                        key: formKey,
                        child: Column(
                          children: [
                            if (name == "tglLahir") ...[
                              FormBuilderDateTimePicker(
                                decoration: const InputDecoration(
                                    suffixIcon: Icon(Icons.date_range),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: cNeutral1))),
                                initialValue: DateTime.parse(initial),
                                name: name,
                                inputType: InputType.date,
                              ),
                            ] else if (name == "password") ...[
                              FormBuilderTextField(
                                obscureText: true,
                                decoration: const InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: cNeutral1)),
                                    hintText: "Masukkan password sekarang"),
                                name: name,
                                autofocus: true,
                                keyboardType: keyboardType,
                              ),
                              FormBuilderTextField(
                                obscureText: true,
                                decoration: const InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: cNeutral1)),
                                    hintText: "Masukkan password baru"),
                                name: "oldPassword",
                                keyboardType: keyboardType,
                              ),
                            ] else ...[
                              FormBuilderTextField(
                                decoration: const InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: cNeutral1))),
                                initialValue: initial,
                                name: name,
                                autofocus: true,
                                keyboardType: keyboardType,
                              ),
                            ],
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.02),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                      style: ButtonStyle(
                                        side: MaterialStateProperty.all(
                                            const BorderSide(
                                                width: 2, color: cPrimary1)),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "Batal",
                                        style: paragraphBold2(cPrimary1),
                                      )),
                                  SizedBox(
                                    width: size.width * 0.02,
                                  ),
                                  TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor: cPrimary1,
                                      ),
                                      onPressed: () {
                                        formKey.currentState!.save();
                                        if (formKey.currentState!.validate()) {
                                          Provider.of<AccoutnViewModel>(context,
                                                  listen: false)
                                              .updateUser(
                                                  name,
                                                  formKey.currentState!
                                                      .value[name],
                                                  formKey.currentState!.value[
                                                          "oldPassword"] ??
                                                      "")
                                              .then((value) {
                                            if (value == true) {
                                              Navigator.pop(context);
                                              showSuccess(
                                                  const Text(
                                                      "Data berhasil diubah"),
                                                  context);
                                            } else {
                                              Navigator.pop(context);
                                              showError(
                                                  const Text(
                                                      "Data gagal diubah"),
                                                  context);
                                            }
                                          });
                                        }
                                      },
                                      child: Text("Simpan",
                                          style: paragraphBold2(cMainWhite)))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ]),
              ),
            ));
  }
}
