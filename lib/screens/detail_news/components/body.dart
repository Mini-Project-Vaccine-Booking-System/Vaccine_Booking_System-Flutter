import 'package:flutter/material.dart';
import '../../../bindings/package_binding.dart';
import '../../../bindings/view_model_binding.dart';
import '../../../constants.dart';

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
                borderRadius: const BorderRadius.all(Radius.circular(20)),
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
              style: paragraphRegular2(cMainBlack),
            )
          ],
        ));
  }
}
