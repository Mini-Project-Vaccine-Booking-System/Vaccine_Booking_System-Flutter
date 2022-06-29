import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../view_model/news_view_model.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var news = Provider.of<NewsViewModel>(context, listen: false);
    return SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.02,
            ),
            SafeArea(
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Center(
                    child: Text(
                      "Detail Berita",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              color: cMainBlack,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                          color: cPrimary1, shape: BoxShape.circle),
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Container(
              margin: EdgeInsets.only(bottom: size.height * 0.01),
              height: 160,
              width: size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(news.getDataSelect.image),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
            Text(
              "Author : ${news.getDataSelect.author}, ${news.getDataSelect.publishedAt}",
              style: paragraphSemiBold4(cNeutral3),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Text(
              news.getDataSelect.title,
              style: paragraphSemiBold0(Colors.black),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Text(
              news.getDataSelect.content,
              style: paragraphMedium2(cMainBlack),
            )
          ],
        ));
  }
}
