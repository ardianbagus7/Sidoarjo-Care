import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:sidoarjocovid/Animation/FadeIn.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
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
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.keyboard_arrow_left,
                              size: 40.0,
                            ),
                            color: Colors.white,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          Text(
                            'About Apps',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(color: Colors.white),
                              fontSize: 20,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 50.0)
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Expanded(
                        child: Container(
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
                                  padding: const EdgeInsets.only(
                                      left: 25.0, right: 25.0),
                                  child: Text(
                                    'Tentang Developer',
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
                                2.0,
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 25.0, right: 25.0),
                                  child: Text(
                                    'Aplikasi ini dibuat untuk memudahkan warga sidoarjo memantau kondisi perkembangan Covid-19 yang terjadi',
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
                              SizedBox(
                                height: 20.0,
                              ),
                              Info(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  void customLaunch(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print('tidak bisa terhubung $command');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
          child: FadeIn(
            2.5,
            Container(
              width: double.infinity,
              height: 170.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Aplikasi ini dibuat oleh :',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Color(0xFF180A05),
                        ),
                        fontSize: 15,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      'Ardian Bagus Wicaksono',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Color(0xFF180A05),
                        ),
                        fontSize: 22,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        MaterialButton(
                          padding: EdgeInsets.all(0),
                          onPressed: () {
                            customLaunch('mailto:ardianbagus7@gmail.com');
                          },
                          child: Container(
                            height: 50.0,
                            width: 50.0,
                            decoration: BoxDecoration(
                              image: new DecorationImage(
                                image: AssetImage('assets/images/Gmail.png'),
                              ),
                            ),
                          ),
                        ),
                        MaterialButton(
                          padding: EdgeInsets.all(0),
                          onPressed: () {
                            customLaunch(
                                'https://www.instagram.com/ardianbagus_/');
                          },
                          child: Container(
                            height: 50.0,
                            width: 50.0,
                            decoration: BoxDecoration(
                              image: new DecorationImage(
                                image:
                                    AssetImage('assets/images/instagram.png'),
                              ),
                            ),
                          ),
                        ),
                        MaterialButton(
                          padding: EdgeInsets.all(0),
                          onPressed: () {
                            customLaunch(
                                'https://www.linkedin.com/in/ardianbagus/');
                          },
                          child: Container(
                            height: 50.0,
                            width: 50.0,
                            decoration: BoxDecoration(
                              image: new DecorationImage(
                                image: AssetImage('assets/images/linkedin.png'),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
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
          3.0,
          Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              child: ListTile(
                leading: Icon(
                  Icons.file_download,
                  color: Color(0xFF5145FF),
                ),
                title: Text(
                  'Update Aplikasi',
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
                    color: Color(0xFF5145FF),
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
                      'UPDATE',
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
                  customLaunch(
                      'https://drive.google.com/drive/u/0/folders/1MhwRyzeXz6dxASWZ6G_SNZWWfo2HXCbl');
                },
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
              'Sumber Data',
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
          4.0,
          Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
            child: Text(
              'Data diambil dari situs resmi Covid-19 Pemerintah',
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
        SizedBox(
          height: 10.0,
        ),
        FadeIn(
          4.5,
          Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              child: ListTile(
                leading: Icon(
                  Icons.web,
                  color: Color(0xFF5145FF),
                  size: 30.0,
                ),
                title: Text(
                  'covid19.go.id',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Color(0xFF180A05),
                    ),
                    fontSize: 15,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  color: Color(0xFF5145FF),
                  size: 30.0,
                ),
                onTap: () {
                  customLaunch('https://covid19.go.id/');
                },
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        FadeIn(
          5.0,
          Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              child: ListTile(
                leading: Icon(
                  Icons.web,
                  color: Color(0xFF5145FF),
                  size: 30.0,
                ),
                title: Text(
                  'infocovid19.jatimprov.go.id',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Color(0xFF180A05),
                    ),
                    fontSize: 15,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  color: Color(0xFF5145FF),
                  size: 30.0,
                ),
                onTap: () {
                  customLaunch('http://infocovid19.jatimprov.go.id/');
                },
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        FadeIn(
          5.5,
          Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              child: ListTile(
                leading: Icon(
                  Icons.web,
                  color: Color(0xFF5145FF),
                  size: 30.0,
                ),
                title: Text(
                  'covid19.sidoarjokab.go.id',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Color(0xFF180A05),
                    ),
                    fontSize: 15,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  color: Color(0xFF5145FF),
                  size: 30.0,
                ),
                onTap: () {
                  customLaunch('https://covid19.sidoarjokab.go.id/');
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
