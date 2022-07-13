import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaccine/screens/home_screen/components/caraousel_news.dart';
import 'package:vaccine/screens/news_more_screen/news_more_scree.dart';
import 'package:vaccine/screens/result_faskes_screen/result_faskes_screen.dart';
import 'package:vaccine/view_model/account_view_model.dart';
import 'package:vaccine/view_model/news_view_model.dart';
import '../../../constants.dart';
import '../../../view_model/hospital_view_model.dart';
import 'horizontal_list.dart';
import 'menu.dart';
import 'top_card.dart';
import 'top_name.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<bool> isLoading = [false, false];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var hospital = Provider.of<HospitalViewModel>(context, listen: false);
    var news = Provider.of<NewsViewModel>(context, listen: false);
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.02,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: TopCard(size: size),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: const Menu(),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Lokasi Vaksin Hari Ini",
                  style: paragraphBold2(cMainBlack),
                ),
                GestureDetector(
                  onTap: () {
                    /*   setState(() {
                      isLoading[0] = true;
                    }); */
                    /* hospital.getDataByCity("surakarta").then((value) {
                      setState(() {
                        isLoading[0] = false;
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => ResultFaskesScreen()));
                    }); */
                  },
                  child: isLoading[0] == false
                      ? Text(
                          "Lihat Semua",
                          style: paragraphBold4(cPrimary1),
                        )
                      : const SizedBox(
                          width: 11,
                          height: 11,
                          child: CircularProgressIndicator(
                            color: cPrimary2,
                          ),
                        ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          HorizontalList(size: size),
          SizedBox(
            height: size.height * 0.03,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Informasi Covid-19 Terkini",
                  style: paragraphBold2(cMainBlack),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const NewsMoreScreen()));
                  },
                  child: Text(
                    "Lihat Semua",
                    style: paragraphBold4(cPrimary1),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          CarouselNews(size: size),
          SizedBox(
            height: size.height * 0.02,
          )
        ],
      ),
    );
  }
}
