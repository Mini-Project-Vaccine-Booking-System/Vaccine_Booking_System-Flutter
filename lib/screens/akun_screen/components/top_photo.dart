import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import '../../../bindings/package_binding.dart';
import '../../../constants.dart';
import '../../../bindings/view_model_binding.dart';

class TopPhoto extends StatefulWidget {
  const TopPhoto({Key? key, required this.size}) : super(key: key);
  final Size size;

  @override
  State<TopPhoto> createState() => _TopPhotoState();
}

class _TopPhotoState extends State<TopPhoto> {
  XFile? pickedFile;
  UploadTask? uploadTask;
  String urlImage = "";
  String? nameFile;

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
      if (pickedFile != null) {
        nameFile = basename(pickedFile!.path);
      }
    });

    print(pickedFile);
  }

  @override
  Widget build(BuildContext context) {
    final account = Provider.of<AccoutnViewModel>(context);
    return Center(
      child: Column(
        children: [
          Stack(
            children: [
              account.data != null && account.data!.image != ""
                  ? CachedNetworkImage(
                      imageUrl: account.data!.image,
                      imageBuilder: (context, imageProvider) => Container(
                        margin: const EdgeInsets.only(
                            bottom: 15, right: 15, left: 15),
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.4),
                                offset: const Offset(0, 1)),
                          ],
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                              fit: BoxFit.cover, image: imageProvider),
                        ),
                      ),
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey[500]!,
                        highlightColor: Colors.grey[300]!,
                        child: Container(
                          margin: const EdgeInsets.only(
                              bottom: 15, right: 15, left: 15),
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.4),
                                  offset: const Offset(0, 1)),
                            ],
                            shape: BoxShape.rectangle,
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => Container(
                        margin: const EdgeInsets.only(
                            bottom: 15, right: 15, left: 15),
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.4),
                                offset: const Offset(0, 1)),
                          ],
                          shape: BoxShape.rectangle,
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/avatar.png")),
                        ),
                      ),
                    )
                  : Container(
                      margin: const EdgeInsets.only(
                          bottom: 15, right: 15, left: 15),
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.4),
                              offset: const Offset(0, 1)),
                        ],
                        shape: BoxShape.rectangle,
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/avatar.png")),
                      ),
                    ),
              Positioned(
                  bottom: 2,
                  right: 2,
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            String? fileName;
                            return AlertDialog(
                              title: const Text("Foto Profil"),
                              content: StatefulBuilder(
                                builder: (BuildContext context,
                                        StateSetter setState) =>
                                    Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text("*Format dokument jpg, png"),
                                    ElevatedButton(
                                      onPressed: () async {
                                        await selectFile().then((value) =>
                                            setState(
                                                () => fileName = nameFile));
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                cPrimary1),
                                      ),
                                      child: const Text("Unggah"),
                                    ),
                                    if (fileName != null) ...[Text(fileName!)]
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      "Batal",
                                      style: TextStyle(color: cPrimary1),
                                    )),
                                TextButton(
                                    onPressed: () async {
                                      if (pickedFile != null) {
                                        Navigator.pop(context);
                                        await uploadFile().then((value) =>
                                            account.updatePhoto(value));
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content:
                                                Text("foto belum diunggah"),
                                            duration: Duration(seconds: 2),
                                          ),
                                        );
                                      }
                                    },
                                    child: const Text(
                                      "Kirim",
                                      style: TextStyle(color: cPrimary1),
                                    )),
                              ],
                            );
                          });
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
          if (uploadTask != null) ...[
            SizedBox(height: widget.size.height * 0.03),
            buildProgress(),
          ],
        ],
      ),
    );
  }

  Widget buildProgress() => StreamBuilder<TaskSnapshot>(
        stream: uploadTask?.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;
            double progress = data.bytesTransferred / data.totalBytes;

            return SizedBox(
              height: 20,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: LinearProgressIndicator(
                      value: progress,
                      backgroundColor: Colors.grey,
                      color: cPrimary1,
                    ),
                  ),
                  Center(
                    child: Text(
                      '${(100 * progress).roundToDouble()}%',
                      style: const TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            );
          } else {
            return const SizedBox(
              height: 50,
            );
          }
        },
      );
}
