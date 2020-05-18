import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sidoarjocovid/screens/aboutApp_page.dart';
import 'package:sidoarjocovid/utilities/FadeIn.dart';
import 'package:simple_animations/simple_animations.dart';

class InformasiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Color(0xFF5145FF),
        height: 1100.0,
        child: SafeArea(
          child: Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(
                          width: 50.0,
                        ),
                        FadeIn(
                          0.5,
                          Text(
                            'Pusat Informasi',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(color: Colors.white),
                              fontSize: 20,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        FadeIn(
                          0.5,
                          IconButton(
                            icon: Icon(
                              Icons.notifications,
                              size: 30.0,
                            ),
                            color: Colors.white,
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => AboutApp(),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Expanded(
                    child: Container1(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Container1 extends StatelessWidget {
  int _index = 0;
  List<String> gejala = [
    'Demam',
    'Sakit Kepala',
    'Batuk Kering',
    'Lemas',
    'Sakit Tenggorokan',
    'Sesak Nafas'
  ];
  List<String> keterangan = [
    'Demam menunjukkan gejala awal corona, demam biasanya mencapai suhu 38 derajat celcius keatas',
    'Dengan adanya demam yang tinggi, COVID-19 seringkali diikuti dengan gejala sakit kepala',
    'Batuk Kering tidak beriak dan berulang ulang merupakan tanda infeksi aktif di paru-paru, yang mungkin bisa disebabkan karena COVID-19',
    'Infeksi COVID-19 yang telah menyebar ke seluruh tubuh akan menghabiskan energi yang banyak sehingga seringkali dapat mengakibatkan lemas',
    'Infeksi COVID-19 akan melalui jalur pernafasan sehingga dapat mengakibatkan radang pada tenggorokan dan rasa nyeri',
    'Apabila COVID-19 berkembang dengan cepat dan besar di paru-paru, fungsi paru akan menurun sehingga terjadi sesak nafas'
  ];
  int _index2 = 0;
  List<String> pasien = [
    'ODP',
    'PDP',
    'Positif',
  ];
  List<String> ketPasien = [
    'Orang Dalam Pemantauan',
    'Pasien Dalam Pengawasan',
    'Pasien Pengidap Covid-19',
  ];
  @override
  Widget build(BuildContext context) {
    return ControlledAnimation(
      curve: Curves.easeOut,
      duration: Duration(milliseconds: 500),
      tween: Tween<double>(begin: 1000.0, end: 0.0),
      builder: (context, animation) {
        return Container(
          margin: EdgeInsets.only(top: animation),
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFFF1F4FC),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(40.0),
              topLeft: Radius.circular(40.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 40.0,
              ),
              FadeIn(
                1.0,
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                  child: Text(
                    'Kenali Gejalanya',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: Color(0xFF180A05),
                      ),
                      fontSize: 20,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              FadeIn(
                1.5,
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                  child: Text(
                    'Jangan Panik, Kenali gejalanya dan deteksi virus corona sejak dini. Hanya perlu mengatur jarak, hindari bersalaman dan bila sakit memakai masker, dan jaga kebersihan',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: Color(0xFF180A05),
                      ),
                      fontSize: 15,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              FadeIn(
                2.0,
                SizedBox(
                  height: 300.0,
                  child: PageView.builder(
                    itemCount: 6,
                    controller: PageController(viewportFraction: 0.7),
                    onPageChanged: (int index) {
                      setState() {
                        _index = index;
                      }
                    },
                    itemBuilder: (_, i) {
                      return Transform.scale(
                        scale: i == _index ? 1 : 1,
                        child: Card(
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Stack(
                            children: <Widget>[
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        height: 130.0,
                                        width: 130.0,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'lib/images/gejala$i.png'),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        gejala[i],
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              color: Color(0xFF837ACF)),
                                          fontSize: 25,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        keterangan[i],
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              color: Color(0xFF837ACF)),
                                          fontSize: 13,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              FadeIn(
                2.5,
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                  child: Text(
                    'Kenali Pasiennya',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: Color(0xFF180A05),
                      ),
                      fontSize: 20,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              FadeIn(
                3.0,
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                  child: Text(
                    'Terdapat penyebutan khusus dalam penyebutan pasien terjangkit wabah atau diduga terkena wabah yaitu ODP, PDP, dan Positif',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: Color(0xFF180A05),
                      ),
                      fontSize: 15,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              FadeIn(
                3.5,
                SizedBox(
                  height: 350.0,
                  child: PageView.builder(
                    itemCount: 3,
                    controller: PageController(viewportFraction: 0.7),
                    onPageChanged: (int index2) {
                      setState() {
                        _index2 = index2;
                      }
                    },
                    itemBuilder: (_, j) {
                      return Transform.scale(
                        scale: j == _index2 ? 1 : 1,
                        child: Card(
                          color: Color(0xFFAC9EC6),
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Stack(
                            children: <Widget>[
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        height: 180.0,
                                        width: 180.0,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'lib/images/pasien$j.png'),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        pasien[j],
                                        style: GoogleFonts.poppins(
                                          textStyle:
                                              TextStyle(color: Colors.white),
                                          fontSize: 25,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        ketPasien[j],
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.poppins(
                                          textStyle:
                                              TextStyle(color: Colors.white),
                                          fontSize: 25,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
