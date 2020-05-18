import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sidoarjocovid/screens/aboutApp_page.dart';
import 'package:sidoarjocovid/utilities/FadeIn.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:url_launcher/url_launcher.dart';
import 'rsMap_page.dart';

class BantuanPage extends StatefulWidget {
  @override
  _BantuanPageState createState() => _BantuanPageState();
}

class _BantuanPageState extends State<BantuanPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 1000.0,
        color: Color(0xFF5145FF),
        child: SafeArea(
          child: SizedBox.expand(
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
                              'Pusat Bantuan',
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
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Container1 extends StatefulWidget {
  @override
  _Container1State createState() => _Container1State();
}

class _Container1State extends State<Container1> {
  void customLaunch(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print('tidak bisa terhubung $command');
    }
  }

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
                    'Posko Penanganan COVID-19',
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
              FadeIn(
                1.0,
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                  child: Text(
                    'Kabupaten Sidoarjo',
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
                    'Jangan ragu untuk menghubungi nomor berikut jika kondisi memang penting atau bahkan darurat',
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
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                  child: Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    child: ListTile(
                      leading: Icon(
                        Icons.call,
                        color: Color(0xFF5145FF),
                      ),
                      title: Text(
                        '(031) 9971333',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: Color(0xFF180A05),
                          ),
                          fontSize: 20,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: Container(
                        height: 30.0,
                        width: 90.0,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              offset: Offset(0.0, 0.5),
                              blurRadius: 15.0,
                            )
                          ],
                        ),
                        child: Center(
                          child: Text(
                            'PANGGIL!',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: Colors.white,
                              ),
                              fontSize: 15,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        customLaunch('tel:03199171333');
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              FadeIn(
                2.5,
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                  child: Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    child: ListTile(
                      leading: Icon(
                        Icons.call,
                        color: Color(0xFF5145FF),
                      ),
                      title: Text(
                        '081390170662',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: Color(0xFF180A05),
                          ),
                          fontSize: 20,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: Container(
                        height: 30.0,
                        width: 90.0,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              offset: Offset(0.0, 0.5),
                              blurRadius: 15.0,
                            )
                          ],
                        ),
                        child: Center(
                          child: Text(
                            'PANGGIL!',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: Colors.white,
                              ),
                              fontSize: 15,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        customLaunch('tel:081390170662');
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              FadeIn(
                3.0,
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                  child: Container(
                    height: 140.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Wrap(
                            direction: Axis.vertical,
                            children: <Widget>[
                              Text(
                                'HOTLINE',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: Color(0xFF837ACF),
                                  ),
                                  fontSize: 20,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Wrap(
                                spacing: 10,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: <Widget>[
                                  Text(
                                    '119',
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: Color(0xFF180A05),
                                      ),
                                      fontSize: 50,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    'EXT 9',
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: Color(0xFF180A05),
                                      ),
                                      fontSize: 20,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 30.0,
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          FlatButton(
                            padding: EdgeInsets.all(0),
                            onPressed: () {
                              customLaunch('tel:119');
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    offset: Offset(0.0, 0.5),
                                    blurRadius: 15.0,
                                  )
                                ],
                              ),
                              height: 30.0,
                              width: 90.0,
                              child: Center(
                                child: Text(
                                  'PANGGIL!',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                    ),
                                    fontSize: 15,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
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
                height: 20.0,
              ),
              FadeIn(
                3.5,
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                  child: Text(
                    'Dinas Kesehatan Sidoarjo',
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
              SizedBox(height: 20.0),
              FadeIn(
                4.0,
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                  child: Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    child: ListTile(
                      leading: Icon(
                        Icons.call,
                        color: Color(0xFF5145FF),
                      ),
                      title: Text(
                        '(031) 8941051',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: Color(0xFF180A05),
                          ),
                          fontSize: 20,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: Container(
                        height: 30.0,
                        width: 90.0,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              offset: Offset(0.0, 0.5),
                              blurRadius: 15.0,
                            )
                          ],
                        ),
                        child: Center(
                          child: Text(
                            'PANGGIL!',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: Colors.white,
                              ),
                              fontSize: 15,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        customLaunch('tel:0318941051');
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              FadeIn(
                4.5,
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                  child: Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Color(0xFFAC9EC6),
                        backgroundImage:
                            ExactAssetImage('lib/images/Hospital.png'),
                      ),
                      title: Text(
                        'Rumah Sakit Rujukan',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: Color(0xFF180A05),
                          ),
                          fontSize: 20,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: Icon(
                        Icons.keyboard_arrow_right,
                        size: 50.0,
                        color: Color(0xFF5145FF),
                      ),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => RSMAP(),
                          ),
                        );
                      },
                    ),
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