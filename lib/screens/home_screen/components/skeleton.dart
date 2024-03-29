import 'package:flutter/material.dart';
import '../../../bindings/package_binding.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: size.height * 0.08),
          Shimmer.fromColors(
            baseColor: Colors.grey[500]!,
            highlightColor: Colors.grey[300]!,
            child: Container(
              width: size.width,
              height: size.height * 0.1,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(height: size.height * 0.02),
          Shimmer.fromColors(
            baseColor: Colors.grey[500]!,
            highlightColor: Colors.grey[300]!,
            child: Container(
              width: size.width,
              height: size.height * 0.2,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(height: size.height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey[500]!,
                highlightColor: Colors.grey[300]!,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.grey,
                  ),
                ),
              ),
              Shimmer.fromColors(
                baseColor: Colors.grey[500]!,
                highlightColor: Colors.grey[300]!,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.grey,
                  ),
                ),
              ),
              Shimmer.fromColors(
                baseColor: Colors.grey[500]!,
                highlightColor: Colors.grey[300]!,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: size.height * 0.02),
          Shimmer.fromColors(
            baseColor: Colors.grey[500]!,
            highlightColor: Colors.grey[300]!,
            child: Container(
              width: size.width,
              height: size.height * 0.2,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(height: size.height * 0.02),
          Shimmer.fromColors(
            baseColor: Colors.grey[500]!,
            highlightColor: Colors.grey[300]!,
            child: Container(
              width: size.width,
              height: size.height * 0.2,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
