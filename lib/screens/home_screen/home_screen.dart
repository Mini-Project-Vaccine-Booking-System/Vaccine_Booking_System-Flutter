import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaccine/components/initial.dart';
import 'package:vaccine/screens/home_screen/components/skeleton.dart';
import '../../constants.dart';
import '../../view_model/account_view_model.dart';
import '../akun_screen/akun_screen.dart';
import 'components/body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool? isInit;

  @override
  void didChangeDependencies() async {
    if (isInit == null) {
      await Initial.getInitialData(context).then((value) {
        if (value == true) {
          setState(() {
            isInit = false;
          });
        }
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
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
                        TextSpan(
                          text: "Rafi Ramadhana",
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
                        Text(
                          "Yogyakarta, DIY",
                          style: paragraphMedium2(cNeutral1),
                        )
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
                child: Container(
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
        // title: Container(
        //   margin: EdgeInsets.only(top: size.height * 0.04),
        //   padding: EdgeInsets.only(left: size.width * 0.05),
        //   child: Column(
        //     children: [
        //       RichText(
        //         text: TextSpan(children: [
        //           TextSpan(
        //             text: "Halo, ",
        //             style: headingBold2(Colors.black),
        //           ),
        //           TextSpan(
        //             text: "Rafi Ramadhana",
        //             style: headingBold2(Colors.black),
        //           ),
        //         ]),
        //         overflow: TextOverflow.ellipsis,
        //         maxLines: 1,
        //       ),
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.start,
        //         children: [
        //           const Icon(
        //             Icons.location_on_rounded,
        //             color: cPrimaryG,
        //             size: 16,
        //           ),
        //           SizedBox(
        //             width: size.width * 0.02,
        //           ),
        //           Text(
        //             "Surakarta, Jawa Tengah",
        //             style: paragraphMedium2(cNeutral1),
        //           )
        //         ],
        //       )
        //     ],
        //   ),
        // ),
      ),
      body: Body(),
      // FutureBuilder(
      //   future:
      //       Provider.of<AccoutnViewModel>(context, listen: false).inisialData(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return Skeleton();
      //     }

      //     return Body();
      //   },
      // ),
    );
  }
}
