import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vaccine/view_model/news_view_model.dart';

import '../../../components/glass.dart';
import '../../../constants.dart';
import '../../detail_news/detail_news.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var news = Provider.of<NewsViewModel>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          // SizedBox(
          //   height: size.height * 0.02,
          // ),
          // SafeArea(
          //   child: Padding(
          //     padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          //     child: Stack(
          //       alignment: Alignment.centerLeft,
          //       children: [
          //         Center(
          //           child: Text(
          //             "Berita Terkini",
          //             style: GoogleFonts.poppins(
          //                 textStyle: const TextStyle(
          //                     color: cMainBlack,
          //                     fontSize: 18,
          //                     fontWeight: FontWeight.bold)),
          //           ),
          //         ),
          //         InkWell(
          //           onTap: () {
          //             Navigator.pop(context);
          //           },
          //           child: Container(
          //             width: 32,
          //             height: 32,
          //             decoration: BoxDecoration(
          //                 color: cPrimary1, shape: BoxShape.circle),
          //             child: Icon(
          //               Icons.arrow_back_ios_rounded,
          //               color: Colors.white,
          //             ),
          //           ),
          //         )
          //       ],
          //     ),
          //   ),
          // ),
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05, vertical: size.height * 0.03),
              itemCount: news.newsData.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    news.setDataSelect(news.newsData[index]).then((value) =>
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => DetailNews())));
                  },
                  child: Container(
                      margin: EdgeInsets.only(bottom: size.height * 0.03),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(news.newsData[index].image),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 2,
                              color: Colors.black.withOpacity(0.2),
                              offset: Offset(0, 2)),
                        ],
                      ),
                      child: Glass(
                        children: [
                          Text(
                            news.newsData[index].title,
                            style: paragraphSemiBold2(cMainBlack),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            news.newsData[index].description,
                            style: paragraphRegular4(cNeutral3),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      )),
                );
              }),
        ],
      ),
    );
  }
}
