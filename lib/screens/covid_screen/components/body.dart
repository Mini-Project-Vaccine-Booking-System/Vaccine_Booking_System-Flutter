import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vaccine/constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 3,
      child: Padding(
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
                      "Informasi Covid",
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
              height: size.height * 0.02,
            ),
            Text(
              "Data perkembangan covid hari ini",
              style: paragraphSemiBold2(cNeutral3),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: size.width * 0.25,
                  height: 111,
                  decoration: const BoxDecoration(
                      color: Color(0xFF2C80B8),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/icons/left_covid.png"),
                      Text(
                        "Positif Covid",
                        style: paragraphRegular3(Colors.white),
                      ),
                      Text(
                        "2.589.012",
                        style: paragraphSemiBold1(Colors.white),
                      )
                    ],
                  ),
                ),
                Container(
                  width: size.width * 0.25,
                  height: 111,
                  decoration: const BoxDecoration(
                      color: Color(0xFF0299FF),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/icons/center_covid.png"),
                      Text(
                        "Sembuh",
                        style: paragraphRegular3(Colors.white),
                      ),
                      Text(
                        "2.589.012",
                        style: paragraphSemiBold1(Colors.white),
                      )
                    ],
                  ),
                ),
                Container(
                  width: size.width * 0.25,
                  height: 111,
                  decoration: const BoxDecoration(
                      color: Color(0xFF3FD861),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/icons/right_covid.png"),
                      Text(
                        "Meninggal",
                        style: paragraphRegular3(Colors.white),
                      ),
                      Text(
                        "2.589.012",
                        style: paragraphSemiBold1(Colors.white),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Text(
              "Penyakit Coronavirus (COVID-19)",
              style: paragraphSemiBold2(cNeutral3),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Container(
              height: 48,
              decoration: BoxDecoration(
                  color: Color(0xFF292639),
                  borderRadius: BorderRadius.circular(10)),
              child: const Padding(
                padding: EdgeInsets.all(7.0),
                child: TabBar(
                    indicator: BoxDecoration(
                        color: cPrimary1,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    tabs: [
                      Tab(
                        text: "Gejala",
                      ),
                      Tab(
                        text: "Perawatan",
                      ),
                      Tab(
                        text: "Pencegahan",
                      )
                    ]),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            SizedBox(
              height: 370,
              child: TabBarView(children: [
                TabBarOne(size: size),
                TabBarTwo(size: size),
                Container(
                  width: size.width,
                  child: SingleChildScrollView(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Pengumuman Layanan Masyarakat",
                        style: paragraphRegular4(cNeutral3),
                      ),
                      SizedBox(height: size.height * 0.01),
                      Center(
                        child: Image.asset("assets/icons/icon_center.png"),
                      ),
                      SizedBox(height: size.height * 0.03),
                      Center(
                        child: Text("Cegah COVID dan bantu akhiri pandemi",
                            style: paragraphSemiBold2(cMainBlack)),
                      ),
                      SizedBox(height: size.height * 0.02),
                      Text("Dengan", style: paragraphRegular3(cNeutral3)),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: String.fromCharCode(0x2022),
                            style: paragraphBold3(Colors.black),
                          ),
                          TextSpan(
                            text: " Pakai Masker",
                            style: paragraphRegular3(Colors.black),
                          ),
                        ]),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: String.fromCharCode(0x2022),
                            style: paragraphBold3(Colors.black),
                          ),
                          TextSpan(
                            text: " Cuci Tangan",
                            style: paragraphRegular3(Colors.black),
                          ),
                        ]),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: String.fromCharCode(0x2022),
                            style: paragraphBold3(Colors.black),
                          ),
                          TextSpan(
                            text: " Jaga Jarak Aman & Batasi Mobilitas",
                            style: paragraphRegular3(Colors.black),
                          ),
                        ]),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: String.fromCharCode(0x2022),
                            style: paragraphBold3(Colors.black),
                          ),
                          TextSpan(
                            text: " Lakukan Vaksinasi",
                            style: paragraphRegular3(Colors.black),
                          ),
                        ]),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset("assets/icons/icon_satu.png"),
                            Image.asset("assets/icons/icon_dua.png"),
                            Image.asset("assets/icons/icon_tiga.png"),
                            Image.asset("assets/icons/icon_empat.png"),
                          ])
                    ],
                  )),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}

class TabBarTwo extends StatefulWidget {
  const TabBarTwo({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<TabBarTwo> createState() => _TabBarTwoState();
}

class _TabBarTwoState extends State<TabBarTwo> {
  List<bool> _isOpen = [false, false];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: widget.size.width,
        decoration: BoxDecoration(
            // border: Border.all(color: cNeutral2, width: 2),
            // borderRadius: BorderRadius.circular(10),
            // boxShadow: [
            //   BoxShadow(
            //       spreadRadius: 2,
            //       blurRadius: 5,
            //       color: Colors.black.withOpacity(0.1),
            //       offset: Offset(0, 1)),
            // ],
            ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: ExpansionPanelList(
              elevation: 0,
              expandedHeaderPadding: EdgeInsets.zero,
              expansionCallback: (i, isOpen) =>
                  setState(() => _isOpen[i] = !isOpen),
              children: [
                ExpansionPanel(
                  canTapOnHeader: true,
                  isExpanded: _isOpen[0],
                  headerBuilder: (context, isExpanded) => const ListTile(
                    title: Text(
                      "Isolasi Mandiri",
                      style: TextStyle(
                        color: cPrimary1,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  body: Padding(
                    padding:
                        const EdgeInsets.only(left: 5, right: 5, bottom: 5),
                    child: Column(children: [
                      Text(
                        "Setelah terpapar ke orang yang terinfeksi COVID-19, lakukan tindakan berikut:",
                        style: paragraphRegular3(cMainBlack),
                      ),
                      SizedBox(
                        height: widget.size.height * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: widget.size.width * 0.1,
                            height: 20,
                            child: Center(
                              child: CircleAvatar(
                                radius: 3,
                                backgroundColor: cMainBlack,
                              ),
                            ),
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                                maxWidth: widget.size.width * 0.75),
                            child: Text(
                              "Hubungi penyedia layanan kesehatan atau hotline COVID-19 untuk mendapatkan informasi terkait tempat dan waktu untuk menjalani tes.",
                              style: paragraphRegular3(cMainBlack),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: widget.size.width * 0.1,
                            height: 20,
                            child: Center(
                              child: CircleAvatar(
                                radius: 3,
                                backgroundColor: cMainBlack,
                              ),
                            ),
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                                maxWidth: widget.size.width * 0.75),
                            child: Text(
                              "Taati prosedur pelacakan kontak untuk menghentikan penyebaran virus.",
                              style: paragraphRegular3(cMainBlack),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: widget.size.width * 0.1,
                            height: 20,
                            child: Center(
                              child: CircleAvatar(
                                radius: 3,
                                backgroundColor: cMainBlack,
                              ),
                            ),
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                                maxWidth: widget.size.width * 0.75),
                            child: Text(
                              "Jika tes tidak tersedia, tetaplah di rumah dan jangan lakukan kontak dengan orang lain selama 14 hari.",
                              style: paragraphRegular3(cMainBlack),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: widget.size.width * 0.1,
                            height: 20,
                            child: Center(
                              child: CircleAvatar(
                                radius: 3,
                                backgroundColor: cMainBlack,
                              ),
                            ),
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                                maxWidth: widget.size.width * 0.75),
                            child: Text(
                              "Selama masa karantina, jangan pergi ke kantor, sekolah, atau tempat-tempat umum. Mintalah seseorang mencukupi kebutuhan Anda.",
                              style: paragraphRegular3(cMainBlack),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: widget.size.width * 0.1,
                            height: 20,
                            child: Center(
                              child: CircleAvatar(
                                radius: 3,
                                backgroundColor: cMainBlack,
                              ),
                            ),
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                                maxWidth: widget.size.width * 0.75),
                            child: Text(
                              "Jaga jarak minimal 1 meter dari orang lain, termasuk anggota keluarga Anda.",
                              style: paragraphRegular3(cMainBlack),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: widget.size.width * 0.1,
                            height: 20,
                            child: Center(
                              child: CircleAvatar(
                                radius: 3,
                                backgroundColor: cMainBlack,
                              ),
                            ),
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                                maxWidth: widget.size.width * 0.75),
                            child: Text(
                              "Kenakan masker medis untuk melindungi orang lain, termasuk jika/ketika Anda perlu meminta perawatan medis.",
                              style: paragraphRegular3(cMainBlack),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: widget.size.width * 0.1,
                            height: 20,
                            child: Center(
                              child: CircleAvatar(
                                radius: 3,
                                backgroundColor: cMainBlack,
                              ),
                            ),
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                                maxWidth: widget.size.width * 0.75),
                            child: Text(
                              "Cuci tangan Anda secara rutin.",
                              style: paragraphRegular3(cMainBlack),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: widget.size.width * 0.1,
                            height: 20,
                            child: Center(
                              child: CircleAvatar(
                                radius: 3,
                                backgroundColor: cMainBlack,
                              ),
                            ),
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                                maxWidth: widget.size.width * 0.75),
                            child: Text(
                              "Gunakan ruangan yang terpisah dari anggota keluarga lain, dan jika tidak memungkinkan, selalu kenakan masker medis.",
                              style: paragraphRegular3(cMainBlack),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: widget.size.width * 0.1,
                            height: 20,
                            child: Center(
                              child: CircleAvatar(
                                radius: 3,
                                backgroundColor: cMainBlack,
                              ),
                            ),
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                                maxWidth: widget.size.width * 0.75),
                            child: Text(
                              "Pastikan ventilasi ruangan selalu baik.",
                              style: paragraphRegular3(cMainBlack),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: widget.size.width * 0.1,
                            height: 20,
                            child: Center(
                              child: CircleAvatar(
                                radius: 3,
                                backgroundColor: cMainBlack,
                              ),
                            ),
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                                maxWidth: widget.size.width * 0.75),
                            child: Text(
                              "Jika menggunakan kamar bersama orang lain, beri jarak antar-tempat tidur minimal 1 meter.",
                              style: paragraphRegular3(cMainBlack),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: widget.size.width * 0.1,
                            height: 20,
                            child: Center(
                              child: CircleAvatar(
                                radius: 3,
                                backgroundColor: cMainBlack,
                              ),
                            ),
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                                maxWidth: widget.size.width * 0.75),
                            child: Text(
                              "Amati diri Anda sendiri apakah ada gejala apa pun selama 14 hari.",
                              style: paragraphRegular3(cMainBlack),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: widget.size.width * 0.1,
                            height: 20,
                            child: Center(
                              child: CircleAvatar(
                                radius: 3,
                                backgroundColor: cMainBlack,
                              ),
                            ),
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                                maxWidth: widget.size.width * 0.75),
                            child: Text(
                              "Segera hubungi penyedia layanan kesehatan jika Anda mengalami salah satu tanda bahaya berikut: sulit bernapas, sulit berbicara atau bergerak, bingung, atau merasakan nyeri di dada.",
                              style: paragraphRegular3(cMainBlack),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: widget.size.width * 0.1,
                            height: 20,
                            child: Center(
                              child: CircleAvatar(
                                radius: 3,
                                backgroundColor: cMainBlack,
                              ),
                            ),
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                                maxWidth: widget.size.width * 0.75),
                            child: Text(
                              "Tetaplah positif dengan terus berinteraksi dengan orang-orang terdekat melalui telepon atau internet, dan dengan berolahraga di rumah.",
                              style: paragraphRegular3(cMainBlack),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      )
                    ]),
                  ),
                ),
                ExpansionPanel(
                  canTapOnHeader: true,
                  isExpanded: _isOpen[1],
                  headerBuilder: (context, isExpanded) => ListTile(
                    title: Text(
                      "Terapi Medis",
                      style: TextStyle(
                        color: cPrimary1,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  body: Padding(
                    padding:
                        const EdgeInsets.only(left: 5, right: 5, bottom: 5),
                    child: Column(children: [
                      Text(
                        "Ilmuwan dari seluruh dunia tengah berupaya menemukan dan mengembangkan obat untuk COVID-19.",
                        style: paragraphRegular3(cMainBlack),
                      ),
                      SizedBox(
                        height: widget.size.height * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: widget.size.width * 0.1,
                            height: 20,
                            child: Center(
                              child: CircleAvatar(
                                radius: 3,
                                backgroundColor: cMainBlack,
                              ),
                            ),
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                                maxWidth: widget.size.width * 0.75),
                            child: Text(
                              "Perawatan pendukung yang optimal meliputi pemberian oksigen bagi pasien yang sakit parah dan berisiko mengalami sakit parah, serta alat bantu pernapasan canggih, seperti ventilator, bagi pasien yang sakit kritis.",
                              style: paragraphRegular3(cMainBlack),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: widget.size.width * 0.1,
                            height: 20,
                            child: Center(
                              child: CircleAvatar(
                                radius: 3,
                                backgroundColor: cMainBlack,
                              ),
                            ),
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                                maxWidth: widget.size.width * 0.75),
                            child: Text(
                              "Dexamethasone adalah kortikosteroid yang dapat membantu mengurangi durasi penggunaan ventilator dan menyelamatkan nyawa pasien yang sakit parah dan kritis.",
                              style: paragraphRegular3(cMainBlack),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: widget.size.height * 0.01,
                      ),
                      Text(
                        "WHO tidak merekomendasikan perawatan mandiri dengan obat apa pun, termasuk antibiotik, sebagai pencegahan atau pengobatan untuk COVID-19.",
                        style: paragraphRegular3(cMainBlack),
                      )
                    ]),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}

class TabBarOne extends StatelessWidget {
  const TabBarOne({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Masing-masing orang memiliki respons yang berbeda terhadap COVID-19. Sebagian besar orang yang terpapar virus ini akan mengalami gejala ringan hingga sedang, dan akan pulih tanpa perlu dirawat di rumah sakit.",
              style: paragraphRegular4(cMainBlack),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Text(
              "Gejala yang paling umum:",
              style: paragraphSemiBold4(cMainBlack),
            ),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: String.fromCharCode(0x2022),
                  style: paragraphBold3(Colors.black),
                ),
                TextSpan(
                  text: " demam",
                  style: paragraphRegular4(Colors.black),
                ),
              ]),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: String.fromCharCode(0x2022),
                  style: paragraphBold3(Colors.black),
                ),
                TextSpan(
                  text: " batuk",
                  style: paragraphRegular4(Colors.black),
                ),
              ]),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: String.fromCharCode(0x2022),
                  style: paragraphBold3(Colors.black),
                ),
                TextSpan(
                  text: " kelelahan",
                  style: paragraphRegular4(Colors.black),
                ),
              ]),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: String.fromCharCode(0x2022),
                  style: paragraphBold3(Colors.black),
                ),
                TextSpan(
                  text: " kehilangan rasa atau bau",
                  style: paragraphRegular4(Colors.black),
                ),
              ]),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Text(
              "Gejala yang sedikit tidak umum:",
              style: paragraphSemiBold4(cMainBlack),
            ),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: String.fromCharCode(0x2022),
                  style: paragraphBold3(Colors.black),
                ),
                TextSpan(
                  text: " sakit tenggorokan",
                  style: paragraphRegular4(Colors.black),
                ),
              ]),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: String.fromCharCode(0x2022),
                  style: paragraphBold3(Colors.black),
                ),
                TextSpan(
                  text: " sakit kepala",
                  style: paragraphRegular4(Colors.black),
                ),
              ]),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: String.fromCharCode(0x2022),
                  style: paragraphBold3(Colors.black),
                ),
                TextSpan(
                  text: " sakit dan nyeri",
                  style: paragraphRegular4(Colors.black),
                ),
              ]),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: String.fromCharCode(0x2022),
                  style: paragraphBold3(Colors.black),
                ),
                TextSpan(
                  text: " diare",
                  style: paragraphRegular4(Colors.black),
                ),
              ]),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: String.fromCharCode(0x2022),
                  style: paragraphBold3(Colors.black),
                ),
                TextSpan(
                  text:
                      " ruam pada kulit, atau perubahan warna pada jari tangan atau jari kaki",
                  style: paragraphRegular4(Colors.black),
                ),
              ]),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: String.fromCharCode(0x2022),
                  style: paragraphBold3(Colors.black),
                ),
                TextSpan(
                  text: " mata merah atau iritasi",
                  style: paragraphRegular4(Colors.black),
                ),
              ]),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Text(
              "Gejala serius:",
              style: paragraphSemiBold4(cMainBlack),
            ),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: String.fromCharCode(0x2022),
                  style: paragraphBold3(Colors.black),
                ),
                TextSpan(
                  text: " kesulitan bernapas atau sesak napas",
                  style: paragraphRegular4(Colors.black),
                ),
              ]),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: String.fromCharCode(0x2022),
                  style: paragraphBold3(Colors.black),
                ),
                TextSpan(
                  text: " kesulitan berbicara atau bergerak, atau bingung",
                  style: paragraphRegular4(Colors.black),
                ),
              ]),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: String.fromCharCode(0x2022),
                  style: paragraphBold3(Colors.black),
                ),
                TextSpan(
                  text: " nyeri dada",
                  style: paragraphRegular4(Colors.black),
                ),
              ]),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Text(
              "Segera cari bantuan medis jika Anda mengalami gejala serius. Selalu hubungi dokter atau fasilitas kesehatan sebelum mengunjunginya.",
              style: paragraphRegular4(cMainBlack),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Text(
              "Orang dengan gejala ringan yang dinyatakan sehat harus melakukan perawatan mandiri di rumah.",
              style: paragraphRegular4(cMainBlack),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Text(
              "Rata-rata gejala akan muncul 5–6 hari setelah seseorang pertama kali terinfeksi virus ini, tetapi bisa juga sampai 14 hari setelah terinfeksi.",
              style: paragraphRegular4(cMainBlack),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
          ],
        ),
      ),
    );
  }
}
