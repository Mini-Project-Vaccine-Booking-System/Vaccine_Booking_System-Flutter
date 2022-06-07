import 'dart:ui';
import 'package:flutter/material.dart';

class Glass extends StatelessWidget {
  const Glass({Key? key, required this.children}) : super(key: key);
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
          top: size.height * 0.12,
          bottom: size.height * 0.02,
          left: size.width * 0.02,
          right: size.width * 0.02),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.2),
                Colors.white.withOpacity(0.2)
              ],
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          border: Border.all(width: 1.5, color: Colors.white.withOpacity(0.2))),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}
