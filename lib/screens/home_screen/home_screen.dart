import 'package:flutter/material.dart';
import '../../../bindings/package_binding.dart';
import '../../../bindings/view_model_binding.dart';
import '../../constants.dart';
import '../akun_screen/akun_screen.dart';
import 'components/body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String city = "Yogyakarta";
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      Future.wait([
        Provider.of<AccoutnViewModel>(context, listen: false).inisialData(),
        Provider.of<HospitalViewModel>(context, listen: false).homeData(city),
        Provider.of<NewsViewModel>(context, listen: false).initialData(),
        Provider.of<FamilyViewModel>(context, listen: false).inisialData(),
        Provider.of<TicketViewModel>(context, listen: false).initialData(),
        Provider.of<CovidViewModel>(context, listen: false).getData()
      ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    var account = Provider.of<AccoutnViewModel>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.7,
        backgroundColor: Colors.white,
        toolbarHeight: 95,
        centerTitle: false,
        titleSpacing: 0,
        leadingWidth: 0,
        flexibleSpace: Container(
          margin: EdgeInsets.only(
              left: size.width * 0.05,
              right: size.width * 0.05,
              top: size.height * 0.05,
              bottom: size.height * 0.018),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: "Hai, ",
                          style: headingBold2(Colors.black),
                        ),
                        account.data == null
                            ? TextSpan(
                                text: "Loading ...",
                                style: headingBold2(cNeutral1),
                              )
                            : TextSpan(
                                text: account.data!.nama,
                                style: headingBold2(Colors.black),
                              ),
                      ]),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.location_on_rounded,
                          color: cPrimaryG,
                          size: 16,
                        ),
                        SizedBox(
                          width: size.width * 0.02,
                        ),
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 150),
                          child: Text(
                            city,
                            style: paragraphMedium2(cNeutral1),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  String? tempCity;
                                  return AlertDialog(
                                    title: const Text("Ubah Kota"),
                                    content: FormBuilder(
                                      key: _formKey,
                                      child: FormBuilderTextField(
                                        onChanged: (value) {
                                          setState(() {
                                            tempCity = value!;
                                          });
                                        },
                                        decoration: const InputDecoration(
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: cNeutral1))),
                                        name: "city",
                                        autofocus: true,
                                        keyboardType: TextInputType.text,
                                        textCapitalization:
                                            TextCapitalization.words,
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            if (tempCity != null) {
                                              setState(() {
                                                city = tempCity!;
                                                Provider.of<HospitalViewModel>(
                                                        context,
                                                        listen: false)
                                                    .homeData(city);
                                              });
                                            }
                                          },
                                          child: const Text(
                                            "Ubah",
                                            style: TextStyle(color: cPrimary1),
                                          )),
                                    ],
                                  );
                                });
                          },
                          child: const Icon(
                            Icons.arrow_drop_down,
                            color: cPrimaryG,
                            size: 24,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => const Akun()));
                },
                child: account.data != null && account.data!.image != null
                    ? CachedNetworkImage(
                        imageUrl: account.data!.image,
                        imageBuilder: (context, imageProvider) => Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(
                                  fit: BoxFit.fill, image: imageProvider),
                            )),
                        placeholder: (context, url) => Shimmer.fromColors(
                            baseColor: Colors.grey[500]!,
                            highlightColor: Colors.grey[300]!,
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: const BoxDecoration(
                                color: Colors.grey,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                            )),
                        errorWidget: (context, url, error) => Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                              color: Colors.grey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image:
                                      AssetImage("assets/images/avatar.png"))),
                        ),
                      )
                    : Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/images/avatar.png")),
                        )),
              )
            ],
          ),
        ),
      ),
      body: Body(city: city),
    );
  }
}
