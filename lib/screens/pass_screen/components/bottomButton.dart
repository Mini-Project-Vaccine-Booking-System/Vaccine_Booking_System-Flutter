import 'package:flutter/material.dart';
import '../../home_screen/home_screen.dart';
import '../../../constants.dart';

class BottomButton extends StatefulWidget {
  const BottomButton({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<BottomButton> createState() => _BottomButtonState();
}

class _BottomButtonState extends State<BottomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: widget.size.width * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const HomeScreen()),
                    (route) => false);
              },
              style: ElevatedButton.styleFrom(
                  primary: cPrimary1,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  elevation: 3,
                  fixedSize: const Size(250, 60)),
              child: Text(
                "Halaman Utama",
                style: paragraphSemiBold1(cMainWhite),
              )),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  color: cMainWhite,
                  border: Border.all(color: cPrimary1, width: 2),
                  borderRadius: const BorderRadius.all(Radius.circular(15))),
              child: const Icon(
                Icons.send,
                color: cPrimary1,
                size: 30,
              ),
            ),
          )
        ],
      ),
    );
  }
}
