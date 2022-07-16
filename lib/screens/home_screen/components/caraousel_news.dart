import 'package:flutter/material.dart';
import '../../../bindings/package_binding.dart';
import '../../../bindings/component_binding.dart';
import '../../../bindings/view_model_binding.dart';
import '../../detail_news/detail_news.dart';
import '../../../constants.dart';

class CarouselNews extends StatelessWidget {
  const CarouselNews({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    var news = Provider.of<NewsViewModel>(context);
    final isLoading = news.state == NewsViewState.loading;
    final isError = news.state == NewsViewState.error;

    if (isLoading) {
      return Shimmer.fromColors(
        baseColor: Colors.grey[500]!,
        highlightColor: Colors.grey[300]!,
        child: Container(
          width: size.width,
          height: 150,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.grey,
          ),
        ),
      );
    }

    if (isError) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        width: size.width,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                spreadRadius: 2,
                blurRadius: 1,
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(0, 2)),
          ],
        ),
        child: Column(
          children: [
            Center(
                child: Image.asset(
              "assets/images/error.png",
              scale: 2.5,
            )),
            Center(
              child: Text(
                "Mendapatkan Data Gagal!",
                style: paragraphBold3(cMainBlack),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      );
    }

    if (news.newsData.isEmpty) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        width: size.width,
        height: 150,
        decoration: BoxDecoration(
          // border: Border.all(color: cNeutral1),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                spreadRadius: 2,
                blurRadius: 1,
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(0, 2)),
          ],
        ),
        child: Column(
          children: [
            Center(
                child: Image.asset(
              "assets/images/data.png",
              scale: 2.5,
            )),
            Center(
              child: Text(
                "Data tidak tersedia!",
                style: paragraphBold3(cMainBlack),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      );
    } else {
      return SizedBox(
        height: 150,
        child: CarouselSlider.builder(
            options: CarouselOptions(
              height: size.height * 0.2,
              viewportFraction: 0.9,
              autoPlay: true,
            ),
            itemCount: 3,
            itemBuilder: (context, index, realIndex) {
              return InkWell(
                onTap: () {
                  news.setDataSelect(news.newsData[index]).then((value) =>
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const DetailNews())));
                },
                child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    height: size.height * 0.2,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(news.newsData[index].image),
                          fit: BoxFit.cover),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 1,
                            color: Colors.black.withOpacity(0.2),
                            offset: const Offset(0, 2)),
                      ],
                    ),
                    child: Glass(
                      children: [
                        Text(
                          news.newsData[index].title,
                          style: paragraphSemiBold2(cMainBlack),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        Text(
                          news.newsData[index].description,
                          style: paragraphRegular4(cNeutral3),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        )
                      ],
                    )),
              );
            }),
      );
    }
  }
}
