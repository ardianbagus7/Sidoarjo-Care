import 'package:flutter/material.dart';
import 'package:sidoarjocovid/Scraping/scraping.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;
import 'aboutapp.dart';
import 'package:sidoarjocovid/Animation/FadeIn.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFF1F4FC),
      ),
      child: SafeArea(
        child: FutureBuilder(
          future: Helper().initiate(),
          builder: (context, AsyncSnapshot<List> snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Stack(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FadeIn(
                          0.5,
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 15.0, right: 15.0),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Transform(
                                alignment: Alignment.center,
                                transform: Matrix4.rotationY(math.pi),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.notifications,
                                    size: 30.0,
                                  ),
                                  color: Color(0xFF5145FF),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => AboutApp(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        FadeIn(
                          1.0,
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 25.0, right: 25.0),
                            child: Wrap(
                              spacing: -20,
                              direction: Axis.vertical,
                              children: <Widget>[
                                Text(
                                  'Sidoarjo',
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Color(0xFF180A05),
                                        letterSpacing: .5),
                                    fontSize: 45,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Care',
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Color(0xFF180A05),
                                        letterSpacing: .5),
                                    fontSize: 45,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        FadeIn(
                          1.5,
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 25.0, right: 25.0),
                            child: Container(
                              width: double.infinity,
                              height: 280.0,
                              decoration: BoxDecoration(
                                color: Color(0xFF5145FF),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    offset: Offset(0.0, 0.5),
                                    blurRadius: 15.0,
                                  )
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Update COVID-19',
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.poppins(
                                        textStyle:
                                            TextStyle(color: Colors.white),
                                        fontSize: 18,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    Text(
                                      'SIDOARJO',
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.poppins(
                                        textStyle:
                                            TextStyle(color: Colors.white),
                                        fontSize: 18,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Wrap(
                                      spacing: -20,
                                      direction: Axis.vertical,
                                      children: <Widget>[
                                        Text(
                                          snapshot.data[0],
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.poppins(
                                            textStyle:
                                                TextStyle(color: Colors.white),
                                            fontSize: 50,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          'Positif',
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.poppins(
                                            textStyle:
                                                TextStyle(color: Colors.white),
                                            fontSize: 15,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Wrap(
                                          crossAxisAlignment:
                                              WrapCrossAlignment.center,
                                          spacing: -10,
                                          direction: Axis.vertical,
                                          children: <Widget>[
                                            Text(
                                              snapshot.data[1],
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                    color: Colors.white),
                                                fontSize: 30,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              'Sembuh',
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                    color: Colors.white),
                                                fontSize: 15,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 5.0,
                                        ),
                                        Wrap(
                                          crossAxisAlignment:
                                              WrapCrossAlignment.center,
                                          spacing: -10,
                                          direction: Axis.vertical,
                                          children: <Widget>[
                                            Text(
                                              snapshot.data[2],
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                    color: Colors.white),
                                                fontSize: 30,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              'Meninggal',
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                    color: Colors.white),
                                                fontSize: 15,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 5.0,
                                        ),
                                        Wrap(
                                          crossAxisAlignment:
                                              WrapCrossAlignment.center,
                                          spacing: -10,
                                          direction: Axis.vertical,
                                          children: <Widget>[
                                            Text(
                                              snapshot.data[3],
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                    color: Colors.white),
                                                fontSize: 30,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Text(
                                              'ODP',
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                    color: Colors.white),
                                                fontSize: 15,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 5.0,
                                        ),
                                        Wrap(
                                          crossAxisAlignment:
                                              WrapCrossAlignment.center,
                                          spacing: -10,
                                          direction: Axis.vertical,
                                          children: <Widget>[
                                            Text(
                                              snapshot.data[4],
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                    color: Colors.white),
                                                fontSize: 30,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Text(
                                              'PDP',
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                    color: Colors.white),
                                                fontSize: 15,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Center(
                                      child: Text(
                                        snapshot.data[5],
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.poppins(
                                          textStyle:
                                              TextStyle(color: Colors.white),
                                          fontSize: 15,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        FadeIn(
                          2.0,
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 25.0, right: 25.0),
                            child: Wrap(
                              spacing: -5,
                              direction: Axis.vertical,
                              children: <Widget>[
                                Text(
                                  'Update COVID-19 Nasional',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Color(0xFF180A05),
                                    ),
                                    fontSize: 18,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  snapshot.data[6],
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    textStyle:
                                        TextStyle(color: Color(0xFF180A05)),
                                    fontSize: 15,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        FadeIn(
                          2.5,
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 25.0, right: 25.0),
                            child: Container(
                              width: double.infinity,
                              height: 150.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    offset: Offset(0.0, 0.5),
                                    blurRadius: 15.0,
                                  )
                                ],
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          height: 30.0,
                                          width: 30.0,
                                          child: CircleAvatar(
                                            backgroundColor: Colors.white,
                                            backgroundImage: AssetImage(
                                                'assets/images/positif.png'),
                                          ),
                                        ),
                                        Text(
                                          snapshot.data[7],
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                color: Color(0xFF837ACF)),
                                            fontSize: 35,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text(
                                          'Positif',
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                color: Color(0xFF837ACF)),
                                            fontSize: 15,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          height: 30.0,
                                          width: 30.0,
                                          child: CircleAvatar(
                                            backgroundColor: Colors.white,
                                            backgroundImage: AssetImage(
                                                'assets/images/sembuh.png'),
                                          ),
                                        ),
                                        Text(
                                          snapshot.data[8],
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                color: Color(0xFF837ACF)),
                                            fontSize: 35,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text(
                                          'Sembuh',
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                color: Color(0xFF837ACF)),
                                            fontSize: 15,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          height: 30.0,
                                          width: 30.0,
                                          child: CircleAvatar(
                                            backgroundColor: Colors.white,
                                            backgroundImage: AssetImage(
                                                'assets/images/meninggal.png'),
                                          ),
                                        ),
                                        Text(
                                          snapshot.data[9],
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                color: Color(0xFF837ACF)),
                                            fontSize: 35,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text(
                                          'Meninggal',
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                color: Color(0xFF837ACF)),
                                            fontSize: 15,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                    Positioned(
                      width: MediaQuery.of(context).size.width,
                      left: MediaQuery.of(context).size.width * 0.15,
                      top: 115.0,
                      child: FadeIn(
                        1.5,
                        Container(
                          height: 250.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/MainPage.png'),
                                fit: BoxFit.contain),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Container(
                height: MediaQuery.of(context).size.height,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
