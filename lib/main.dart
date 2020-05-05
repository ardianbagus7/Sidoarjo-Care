import 'package:flutter/material.dart';
import 'indonesia.dart';
import 'scraping.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;
import 'rumahsakit.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MainPage(),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
   int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xFFEEEFF5),
            Color(0xFFFFFFFF),
          ],
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
          child: FutureBuilder(
            future: Helper().initiate(),
            builder: (context, AsyncSnapshot<List> snapshot) {
              if (snapshot.hasData) {
                return SizedBox(
                  child: Stack(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topRight,
                            child: Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.rotationY(math.pi),
                              child: Icon(
                                Icons.short_text,
                                color: Color(0xFF837ACF),
                                size: 50.0,
                              ),
                            ),
                          ),
                          Wrap(
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
                          SizedBox(
                            height: 30.0,
                          ),
                          Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height / 3,
                            decoration: BoxDecoration(
                              color: Color(0xFF5145FF),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20.0),
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
                                      textStyle: TextStyle(color: Colors.white),
                                      fontSize: 18,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  Text(
                                    'SIDOARJO',
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(color: Colors.white),
                                      fontSize: 18,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
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
                                          fontSize: 20,
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
                                        width: 25.0,
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
                                        width: 25.0,
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
                                        width: 25.0,
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
                                  SizedBox(height: 5.0,),
                                  Text(
                                    snapshot.data[5],
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(color: Colors.white),
                                      fontSize: 15,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          Text(
                            'Rumah Sakit Rujukan',
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
                          SizedBox(
                            height: 200,
                            child: PageView.builder(
                              itemCount: 10,
                              controller: PageController(viewportFraction: 0.7),
                              onPageChanged: (int index) => setState(() => _index = index),
                              itemBuilder: (_,i){
                                return Transform.scale(
                scale: i == _index ? 1 : 0.9,
                child: Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      "Card ${i + 1}",
                      style: TextStyle(fontSize: 32),
                    ),
                  ),
                ),
              );
                              },
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        width: MediaQuery.of(context).size.width,
                        left: MediaQuery.of(context).size.width * 0.09,
                        top: MediaQuery.of(context).size.width * 0.27,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 3 / 10,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/MainPage.png'),
                                fit: BoxFit.contain),
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
      ),
    );
  }
}

class KontenDataIndonesia extends StatefulWidget {
  @override
  _KontenDataIndonesiaState createState() => _KontenDataIndonesiaState();
}

class _KontenDataIndonesiaState extends State<KontenDataIndonesia> {
  Helper helper = null;
  @override
  Widget build(BuildContext context) {
    double half = MediaQuery.of(context).size.height / 2;
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      margin: EdgeInsets.only(top: half - half / 2),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFEEEFF5),
            Color(0xFFFFFFFF),
          ],
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
    );
  }
}

class KontenDataSidoarjo extends StatefulWidget {
  @override
  _KontenDataSidoarjoState createState() => _KontenDataSidoarjoState();
}

class _KontenDataSidoarjoState extends State<KontenDataSidoarjo> {
  Helper helper = null;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width * 9 / 10,
            height: MediaQuery.of(context).size.height * 1 / 6,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'SiCOVID',
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          color: Color(0xFFa696c9), letterSpacing: .9),
                      fontSize: 20,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  Text(
                    '',
                    style: TextStyle(
                      fontSize: 5.0,
                    ),
                  ),
                  Text(
                    'PUSAT INFORMASI COVID-19',
                    style: GoogleFonts.roboto(
                        textStyle:
                            TextStyle(color: Colors.white, letterSpacing: .9),
                        fontSize: 20,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '',
                    style: TextStyle(
                      fontSize: 5.0,
                    ),
                  ),
                  Text(
                    'KABUPATEN SIDOARJO',
                    style: GoogleFonts.roboto(
                        textStyle:
                            TextStyle(color: Colors.white, letterSpacing: .9),
                        fontSize: 20,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
        Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 1 / 8,
            width: MediaQuery.of(context).size.width * 9 / 10,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(15.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: Offset(0.0, 3.0),
                  blurRadius: 15.0,
                ),
              ],
            ),
            child: FutureBuilder<List>(
              future: Helper().initiate(),
              builder: (context, AsyncSnapshot<List> snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: <Widget>[Text('Update Kasus COVID-19')],
                  );
                } else {
                  return Container(
                    child: Center(
                      child: Container(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.blue),
                            strokeWidth: 5.0),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        )
      ],
    );
  }
}

class ShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    // set the color property of the paint

    var center = Offset(size.width - size.width * 0.11, size.height / 12);

    paint.color = Color(0xFF1B3360);
    var rect = Rect.fromLTWH(0, 0, size.width, size.height);
    // draw the rectangle using the paint
    canvas.drawRect(rect, paint);

    paint.color = Color(0xFF173670);
    // center of the canvas is (x,y) => (width/2, height/2)
    // draw the circle on centre of canvas having radius 75.0
    canvas.drawCircle(center, 400.0, paint);

    paint.color = Color(0xFF17397C);
    // center of the canvas is (x,y) => (width/2, height/2)
    // draw the circle on centre of canvas having radius 75.0
    canvas.drawCircle(center, 240.0, paint);
    paint.color = Color(0xFF173C85);
    // center of the canvas is (x,y) => (width/2, height/2)
    // draw the circle on centre of canvas having radius 75.0
    canvas.drawCircle(center, 100.0, paint);
    paint.color = Color(0xFF173E8B);
    // center of the canvas is (x,y) => (width/2, height/2)
    // draw the circle on centre of canvas having radius 75.0
    canvas.drawCircle(center, 30.0, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
