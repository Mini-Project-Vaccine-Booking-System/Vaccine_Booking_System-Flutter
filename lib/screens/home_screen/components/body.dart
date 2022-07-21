import 'package:flutter/material.dart';
import '../../../bindings/package_binding.dart';
import '../../../bindings/view_model_binding.dart';
import '../../../screens/news_more_screen/news_more_scree.dart';
import '../../../constants.dart';
import '../../result_faskes_screen/result_faskes_screen.dart';
import 'horizontal_list.dart';
import 'menu.dart';
import 'top_card.dart';
import 'caraousel_news.dart';

class Body extends StatefulWidget {
  const Body({Key? key, required this.city}) : super(key: key);
  final String city;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<bool> isLoading = [false, false];
  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final String stringDate = DateFormat("yyyy-MM-dd").format(now).toString();
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
                    setState(() {
                      isLoading[0] = true;
                    });
                    hospital
                        .getDataByCity(widget.city, stringDate)
                        .then((value) {
                      setState(() {
                        isLoading[0] = false;
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => ResultFaskesScreen(
                                    date: now,
                                  )));
                    });
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const NewsMoreScreen()));
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
