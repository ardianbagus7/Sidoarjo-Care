import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'pages/pusatbantuan.dart';
import 'pages/mapRS.dart';
import 'pages/MainPage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    MainPage(), PusatBantuan(),
    MapRS() // create the pages you want to navigate between
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _children[_currentIndex],
        bottomNavigationBar: CurvedNavigationBar(
            color: Colors.white,
            buttonBackgroundColor: Colors.white,
            backgroundColor: Color(0xFFF1F4FC),
            height: 50,
            items: <Widget>[
              Icon(
                Icons.home,
                size: 20,
                color: Color(0xFF5145FF),
              ),
              Icon(
                Icons.info,
                size: 20,
                color: Color(0xFF5145FF),
              ),
              Icon(
                Icons.help,
                size: 20,
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
