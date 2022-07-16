import 'package:flutter/material.dart';
import '../../../bindings/package_binding.dart';
import '../../../bindings/view_model_binding.dart';
import '../../../bindings/component_binding.dart';
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
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05, vertical: size.height * 0.03),
              itemCount: news.newsData.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    news.setDataSelect(news.newsData[index]).then((value) =>
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const DetailNews())));
                  },
                  child: Container(
                      margin: EdgeInsets.only(bottom: size.height * 0.03),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(news.newsData[index].image),
                            fit: BoxFit.cover),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 2,
                              color: Colors.black.withOpacity(0.2),
                              offset: const Offset(0, 2)),
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
