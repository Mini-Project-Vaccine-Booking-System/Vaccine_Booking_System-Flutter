import 'package:flutter/material.dart';

class Glass extends StatelessWidget {
  const Glass({Key? key, required this.children, required this.status})
      : super(key: key);
  final List<Widget> children;
  final String status;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        top: status != "hospital" ? size.height * 0.12 : size.height * 0.15,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          // gradient: LinearGradient(
          //     colors: [
          //       Colors.white.withOpacity(0.2),
          //       Colors.white.withOpacity(0.2)
          //     ],
          //     begin: AlignmentDirectional.topStart,
          //     end: AlignmentDirectional.bottomEnd),
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          border: Border.all(width: 1.5, color: Colors.white.withOpacity(0.2))),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: children,
          ),
        ),
      ),
    );
  }
}
