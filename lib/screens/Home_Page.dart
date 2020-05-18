import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sidoarjocovid/model/radar_model.dart';
import 'package:sidoarjocovid/provider/radar_provider.dart';
import 'package:sidoarjocovid/provider/sidoarjo_provider.dart';
import 'package:sidoarjocovid/provider/indonesia_provider.dart';
import 'package:sidoarjocovid/screens/aboutApp_page.dart';
import 'package:sidoarjocovid/screens/positifMap_page.dart';
import 'package:sidoarjocovid/utilities/AppStyle.dart';
import 'package:sidoarjocovid/utilities/FadeIn.dart';
import 'dart:math' as math;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var sidoarjo = null;
  @override
  void initState() {
    super.initState();
    Provider.of<SidoarjoProvider>(context, listen: false).getSidoarjoProvider();
    Provider.of<IndonesiaProvider>(context, listen: false)
        .getIndonesiaProvider();
    Provider.of<RadarProvider>(context, listen: false).getRadarProvider();
    if (sidoarjo == null) {
      Future.delayed(Duration(seconds: 10), () => showAlert(context));
    }
  }

  @override
  Widget build(BuildContext context) {
    var sidoarjo = Provider.of<SidoarjoProvider>(context).data;
    var indonesia = Provider.of<IndonesiaProvider>(context).data;
    var radar = Provider.of<RadarProvider>(context).radar;

    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(color: AppStyle.colorBg),
      child: SafeArea(
        child: (sidoarjo != null)
            ? mainPage(sidoarjo, indonesia, radar)
            : SingleChildScrollView(
                child: loadingShimmer(),
              ),
      ),
    );
  }

  // HALAMAN UTAMA
  SingleChildScrollView mainPage(
      List<String> sidoarjo, List<String> indonesia, List<DataSidoarjo> radar) {
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FadeIn(
                0.5,
                aboutApp(),
              ),
              FadeIn(
                1.0,
                sidoarjoCareTag(),
              ),
              SizedBox(
                height: 30.0,
              ),
              FadeIn(
                1.5,
                sidoarjoContainer(sidoarjo),
              ),
              SizedBox(height: 10.0),
              FadeIn(
                2.0,
                (radar != null) ? radarSidoarjo() : loadingShimmerRadar(),
              ),
              SizedBox(
                height: 20.0,
              ),
              FadeIn(
                2.5,
                (indonesia != null)
                    ? indonesiaUpdateTag(indonesia)
                    : loadingShimmerIndo1(),
              ),
              SizedBox(
                height: 10.0,
              ),
              FadeIn(
                3.0,
                (indonesia != null)
                    ? indonesiaContainer(indonesia)
                    : loadingShimmerIndo2(),
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
                      image: AssetImage('lib/images/MainPage.png'),
                      fit: BoxFit.contain),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding loadingShimmerRadar() {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      child: SizedBox(
        width: double.infinity,
        height: 50.0,
        child: Shimmer.fromColors(
            child: Container(
              width: double.infinity,
              height: 50.0,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
            ),
            baseColor: Colors.grey[200],
            highlightColor: Colors.white),
      ),
    );
  }

  Padding radarSidoarjo() {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      child: Material(
        elevation: 0.5,
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        child: ListTile(
          leading: Icon(
            Icons.gps_fixed,
            color: Color(0xFF5145FF),
          ),
          title: Text(
            'Radar COVID-19 Sidoarjo',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: Color(0xFF180A05),
              ),
              fontSize: 17,
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
                builder: (context) => PositifMAP(),
              ),
            );
          },
        ),
      ),
    );
  }

  // ICON ABOUT APP
  Padding aboutApp() {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
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
            color: AppStyle.colorMain,
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
    );
  }

  // JUDUL HALAMAN
  Padding sidoarjoCareTag() {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      child: Wrap(
        spacing: -20,
        direction: Axis.vertical,
        children: <Widget>[
          Text('Sidoarjo',
              textAlign: TextAlign.left, style: AppStyle.textSidoarjoTag),
          Text('Care', textAlign: TextAlign.left, style: AppStyle.textCareTag),
        ],
      ),
    );
  }

  // INFORMASI SIDOARJO
  Padding sidoarjoContainer(List<String> sidoarjo) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      child: Container(
        width: double.infinity,
        height: 280.0,
        decoration: BoxDecoration(
          color: AppStyle.colorMain,
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
                  fontWeight: FontWeight.w500,
                ),
              ),
              Wrap(
                spacing: -20,
                direction: Axis.vertical,
                children: <Widget>[
                  Text(sidoarjo[0],
                      textAlign: TextAlign.left,
                      style: AppStyle.textPositifAngkaSDA),
                  Text('Positif',
                      textAlign: TextAlign.left,
                      style: AppStyle.textPositifSDA),
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: -10,
                    direction: Axis.vertical,
                    children: <Widget>[
                      Text(sidoarjo[1],
                          textAlign: TextAlign.center,
                          style: AppStyle.textAngkaSDA),
                      Text('Sembuh',
                          textAlign: TextAlign.center,
                          style: AppStyle.textKeteranganSDA),
                    ],
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: -10,
                    direction: Axis.vertical,
                    children: <Widget>[
                      Text(sidoarjo[2],
                          textAlign: TextAlign.center,
                          style: AppStyle.textAngkaSDA),
                      Text('Meninggal',
                          textAlign: TextAlign.center,
                          style: AppStyle.textKeteranganSDA),
                    ],
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: -10,
                    direction: Axis.vertical,
                    children: <Widget>[
                      Text(sidoarjo[3],
                          textAlign: TextAlign.center,
                          style: AppStyle.textAngkaSDA),
                      Text('ODP',
                          textAlign: TextAlign.center,
                          style: AppStyle.textKeteranganSDA),
                    ],
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: -10,
                    direction: Axis.vertical,
                    children: <Widget>[
                      Text(sidoarjo[4],
                          textAlign: TextAlign.center,
                          style: AppStyle.textAngkaSDA),
                      Text('PDP',
                          textAlign: TextAlign.center,
                          style: AppStyle.textKeteranganSDA),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              Center(
                child: Text(sidoarjo[5],
                    textAlign: TextAlign.center,
                    style: AppStyle.textKeteranganSDA),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // INFORMASI INDONESIA

  Padding indonesiaUpdateTag(List<String> indonesia) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
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
            indonesia[0],
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(color: Color(0xFF180A05)),
              fontSize: 15,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }

  Padding indonesiaContainer(List<String> indonesia) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 30.0,
                    width: 30.0,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('lib/images/positif.png'),
                    ),
                  ),
                  Text(indonesia[1],
                      textAlign: TextAlign.center,
                      style: AppStyle.textAngkaIndo),
                  Text('Positif',
                      textAlign: TextAlign.left,
                      style: AppStyle.textKeteranganIndo),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 30.0,
                    width: 30.0,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('lib/images/sembuh.png'),
                    ),
                  ),
                  Text(indonesia[2],
                      textAlign: TextAlign.center,
                      style: AppStyle.textAngkaIndo),
                  Text('Sembuh',
                      textAlign: TextAlign.left,
                      style: AppStyle.textKeteranganIndo),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 30.0,
                    width: 30.0,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('lib/images/meninggal.png'),
                    ),
                  ),
                  Text(indonesia[3],
                      textAlign: TextAlign.center,
                      style: AppStyle.textAngkaIndo),
                  Text('Meninggal',
                      textAlign: TextAlign.left,
                      style: AppStyle.textKeteranganIndo),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // LOADING DATA

  Padding loadingShimmer() {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 60.0,
          ),
          SizedBox(
            width: 250.0,
            height: 40.0,
            child: Shimmer.fromColors(
                child: Container(
                  width: double.infinity,
                  height: 280.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                  ),
                ),
                baseColor: Colors.grey[200],
                highlightColor: Colors.white),
          ),
          SizedBox(
            height: 5.0,
          ),
          SizedBox(
            width: 100.0,
            height: 40.0,
            child: Shimmer.fromColors(
                child: Container(
                  width: double.infinity,
                  height: 280.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                  ),
                ),
                baseColor: Colors.grey[200],
                highlightColor: Colors.white),
          ),
          SizedBox(
            height: 40.0,
          ),
          SizedBox(
            width: double.infinity,
            height: 280.0,
            child: Shimmer.fromColors(
                child: Container(
                  width: double.infinity,
                  height: 280.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                ),
                baseColor: Colors.grey[200],
                highlightColor: Colors.white),
          ),
          SizedBox(height: 10.0),
          SizedBox(
            width: double.infinity,
            height: 50.0,
            child: Shimmer.fromColors(
                child: Container(
                  width: double.infinity,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                ),
                baseColor: Colors.grey[200],
                highlightColor: Colors.white),
          ),
          SizedBox(
            height: 30.0,
          ),
          SizedBox(
            width: 250.0,
            height: 20.0,
            child: Shimmer.fromColors(
                child: Container(
                  width: 250.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                  ),
                ),
                baseColor: Colors.grey[200],
                highlightColor: Colors.white),
          ),
          SizedBox(
            height: 5.0,
          ),
          SizedBox(
            width: 200.0,
            height: 20.0,
            child: Shimmer.fromColors(
                child: Container(
                  width: 200.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                  ),
                ),
                baseColor: Colors.grey[200],
                highlightColor: Colors.white),
          ),
          SizedBox(
            height: 20.0,
          ),
          SizedBox(
            width: double.infinity,
            height: 150.0,
            child: Shimmer.fromColors(
                child: Container(
                  width: double.infinity,
                  height: 150.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                ),
                baseColor: Colors.grey[200],
                highlightColor: Colors.white),
          ),
        ],
      ),
    );
  }

  Padding loadingShimmerIndo1() {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 250.0,
            height: 20.0,
            child: Shimmer.fromColors(
                child: Container(
                  width: 250.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                  ),
                ),
                baseColor: Colors.grey[200],
                highlightColor: Colors.white),
          ),
          SizedBox(
            height: 5.0,
          ),
          SizedBox(
            width: 200.0,
            height: 20.0,
            child: Shimmer.fromColors(
                child: Container(
                  width: 200.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                  ),
                ),
                baseColor: Colors.grey[200],
                highlightColor: Colors.white),
          ),
        ],
      ),
    );
  }

  Padding loadingShimmerIndo2() {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          SizedBox(
            width: double.infinity,
            height: 150.0,
            child: Shimmer.fromColors(
                child: Container(
                  width: double.infinity,
                  height: 150.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                ),
                baseColor: Colors.grey[200],
                highlightColor: Colors.white),
          ),
        ],
      ),
    );
  }

  void showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Peringatan',
          style: AppStyle.textMain,
        ),
        content: Container(
          height: 130.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 9 / 10,
                height: 70.0,
                child: Text(
                    'Sedang menyambungkan ke server. Apabila loading belum selesai maka server sedang down. ',style: AppStyle.textSubMain,),
              ),
              SizedBox(height: 10.0),
              FlatButton(
                child: new Text("Ok"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Colors.blue, width: 1, style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(50)),
              ),
            ],
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
      ),
    );
  }
}
