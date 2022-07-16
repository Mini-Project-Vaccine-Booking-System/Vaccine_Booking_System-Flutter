import 'package:flutter/material.dart';
import '../../../bindings/package_binding.dart';
import '../../../bindings/view_model_binding.dart';
import '../../../constants.dart';
import '../../daftar_vaksin_screen/daftar_vaksin_screen.dart';

class TopCard extends StatelessWidget {
  const TopCard({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    final account = Provider.of<AccoutnViewModel>(context);
    return Container(
      width: size.width,
      height: 120,
      decoration: const BoxDecoration(
        color: cPrimary1,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: size.width * 0.05, top: size.height * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: size.width * 0.6,
                  child: Text(
                    "Ayo dapatkan vaksin untuk hidup lebih sehat",
                    style: paragraphSemiBold2(cMainWhite),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: cPrimary3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const DaftarVaksinScreen()));
                    },
                    child: Text(
                      "Daftar Sekarang",
                      style: paragraphBold3(Colors.white),
                    ))
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                "assets/images/image_banner.png",
                fit: BoxFit.cover,
                scale: 1.4,
              ))
        ],
      ),
    );
  }
}
