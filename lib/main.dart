import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sidoarjocovid/provider/indonesia_provider.dart';
import 'package:sidoarjocovid/provider/radar_provider.dart';
import 'package:sidoarjocovid/provider/sidoarjo_provider.dart';
import 'package:sidoarjocovid/screens/Home_Page.dart';
import 'package:sidoarjocovid/screens/bantuan_page.dart';
import 'package:sidoarjocovid/screens/informasi_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => SidoarjoProvider()),
      ChangeNotifierProvider(create: (_) => IndonesiaProvider()),
      ChangeNotifierProvider(create: (_) => RadarProvider()),
    ], child: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 1;
  final List<Widget> _children = [
    BantuanPage(),
    HomePage(),
    InformasiPage() // HOME PAGE
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _children[_currentIndex],
        bottomNavigationBar: CurvedNavigationBar(
            color: Colors.white,
            index: 1,
            buttonBackgroundColor: Colors.white,
            backgroundColor: Color(0xFFF1F4FC),
            height: 50,
            items: <Widget>[
              Icon(
                Icons.phone,
                size: 25,
                color: Color(0xFF5145FF),
              ),
              Icon(
                Icons.home,
                size: 25,
                color: Color(0xFF5145FF),
              ),
              Icon(
                Icons.list,
                size: 25,
                color: Color(0xFF5145FF),
              ),
            ],
            animationDuration: Duration(milliseconds: 200),
            animationCurve: Curves.bounceInOut,
            onTap: (int index) {
              setState(() {
                this._currentIndex = index;
              });
            }),
      ),
    );
  }
}