import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sidoarjocovid/provider/radar_provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:android_intent/android_intent.dart';
import 'package:sidoarjocovid/utilities/AppStyle.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PositifMAP extends StatefulWidget {
  @override
  _PositifMAPState createState() => _PositifMAPState();
}

class _PositifMAPState extends State<PositifMAP> {
  final controller = PageController(viewportFraction: 1);
  final PermissionHandler permissionHandler = PermissionHandler();
  Map<PermissionGroup, PermissionStatus> permissions;
  List<Marker> allMarkers = <Marker>[];
  List<Circle> allCircles = <Circle>[];
  GoogleMapController _controller;
  BitmapDescriptor pinLocationIcon;

  @override
  void initState() {
    super.initState();
    requestLocationPermission();
    _gpsService();

    Future.delayed(Duration.zero, () => showAlert(context));
  }

  Future<bool> _requestPermission(PermissionGroup permission) async {
    final PermissionHandler _permissionHandler = PermissionHandler();
    var result = await _permissionHandler.requestPermissions([permission]);
    if (result[permission] == PermissionStatus.granted) {
      return true;
    }
    return false;
  }

/*Checking if your App has been Given Permission*/
  Future<bool> requestLocationPermission({Function onPermissionDenied}) async {
    var granted = await _requestPermission(PermissionGroup.location);
    if (granted != true) {
      requestLocationPermission();
    }
    debugPrint('requestContactsPermission $granted');
    return granted;
  }

/*Show dialog if GPS not enabled and open settings location*/
  Future _checkGps() async {
    if (!(await Geolocator().isLocationServiceEnabled())) {
      if (Theme.of(context).platform == TargetPlatform.android) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Tidak bisa mendapatkan lokasi"),
                content: const Text('Nyalakan GPS dan coba lagi'),
                actions: <Widget>[
                  FlatButton(
                      child: Text('Ok'),
                      onPressed: () {
                        final AndroidIntent intent = AndroidIntent(
                            action:
                                'android.settings.LOCATION_SOURCE_SETTINGS');
                        intent.launch();
                        Navigator.of(context, rootNavigator: true).pop();
                        _gpsService();
                      })
                ],
              );
            });
      }
    }
  }

/*Check if gps service is enabled or not*/
  Future _gpsService() async {
    if (!(await Geolocator().isLocationServiceEnabled())) {
      _checkGps();
      return null;
    } else
      return true;
  }

  @override
  Widget build(BuildContext context) {
    var radar = Provider.of<RadarProvider>(context).radar;
    if (radar != null) {
      for (int i = 0; i < radar.length; i++) {
        var lat = radar[i].lat;
        var lon = radar[i].lon;
        var kelamin = radar[i].kelamin;
        if (kelamin == 'L') {
          kelamin = 'Laki-Laki';
        } else if (kelamin == 'P') {
          kelamin = 'Perempuan';
        }
        lat = lat.replaceAll(",", ".");
        lat = lat.trim();
        lon = lon.replaceAll(",", ".");
        lon = lon.trim();
        if (lat != "" && lon != "") {
          allMarkers.add(
            Marker(
              markerId: MarkerId("$i"),
              draggable: false,
              icon: BitmapDescriptor.fromAsset("lib/images/Dot.png"),
              onTap: () {
                showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                    elevation: 10.0,
                    context: context,
                    backgroundColor: AppStyle.colorBg,
                    builder: (builder) {
                      return Container(
                          height: 230.0,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 25,
                              vertical: 20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Keterangan Pasien',
                                    style: AppStyle.textMain),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Material(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  child: ListTile(
                                    leading: Icon(
                                      Icons.people,
                                      color: Color(0xFF5145FF),
                                      size: 50.0,
                                    ),
                                    title: Wrap(
                                      direction: Axis.vertical,
                                      children: <Widget>[
                                        Text('Nomor ' + radar[i].nomorkasus,
                                            style: AppStyle.textSubMain),
                                        Text(
                                          'Jenis Kelamin : ' + kelamin,
                                          style: AppStyle.textSubMain,
                                        ),
                                        Text('Umur : ' + radar[i].umur,
                                            style: AppStyle.textSubMain),
                                        Text('Desa : ' + radar[i].desa,
                                            style: AppStyle.textSubMain),
                                        Text(
                                            'Kecamatan : ' + radar[i].kecamatan,
                                            style: AppStyle.textSubMain),
                                        Text(
                                            'Status Pasien : ' +
                                                radar[i].statusPasien,
                                            style: AppStyle.textSubMain),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ));
                    });
                print('Jenis Kelamin : ' +
                    kelamin +
                    '\n' +
                    'Umur : ' +
                    radar[i].umur +
                    '\n' +
                    'Desa : ' +
                    radar[i].desa +
                    '\n' +
                    'Kecamatan : ' +
                    radar[i].kecamatan +
                    '\n' +
                    'Status Pasien : ' +
                    radar[i].statusPasien);
              },
              position: LatLng(double.parse(lat), double.parse(lon)),
            ),
          );
          allCircles.add(Circle(
            circleId: CircleId('$i'),
            center: LatLng(double.parse(lat), double.parse(lon)),
            radius: 100,
            fillColor: Colors.redAccent.withOpacity(0.1),
            strokeColor: Colors.redAccent,
            strokeWidth: 1,
          ));
        } else {}
      }
      print(radar.length);
      print('sukses add data radar');
    } else {}

    return MaterialApp(
        home: Scaffold(
            body: Container(
      color: Color(0xFF5145FF),
      child: SafeArea(
        child: SizedBox.expand(
          child: Stack(
            children: <Widget>[
              Stack(
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
                            'Radar COVID-19 Sidoarjo',
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
                        height: 10.0,
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
                          child: GoogleMap(
                            myLocationButtonEnabled: true,
                            myLocationEnabled: true,
                            initialCameraPosition: CameraPosition(
                                target: LatLng(-7.4462, 112.7178), zoom: 15.0),
                            markers: Set<Marker>.of(allMarkers),
                            circles: Set<Circle>.of(allCircles),
                            onMapCreated: mapCreated,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 80.0,
                    left: 10.0,
                    child: Container(
                      height: 40.0,
                      width: 180.0,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.75),
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Total Positif : ' + radar.length.toString(),
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(color: AppStyle.colorHitam),
                              fontSize: 18,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 80.0,
                    right: 60.0,
                    child: Container(
                      height: 38.0,
                      width: 38.0,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.75),
                        borderRadius: BorderRadius.all(
                          Radius.circular(1.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(0.0, 0.5),
                            blurRadius: 15.0,
                          )
                        ],
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.warning,
                          color: Colors.grey[600],
                          size: 20.0,
                        ),
                        onPressed: () {
                          showAlert(context);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    )));
  }

  void mapCreated(GoogleMapController controller) {
    setState(() {
      _controller = controller;
      _controller.setMapStyle(
          '[{"elementType":"geometry","stylers":[{"color":"#1d2c4d"}]},{"elementType":"labels.text.fill","stylers":[{"color":"#8ec3b9"}]},{"elementType":"labels.text.stroke","stylers":[{"color":"#1a3646"}]},{"featureType":"administrative.country","elementType":"geometry.stroke","stylers":[{"color":"#4b6878"}]},{"featureType":"administrative.land_parcel","elementType":"labels.text.fill","stylers":[{"color":"#64779e"}]},{"featureType":"administrative.province","elementType":"geometry.stroke","stylers":[{"color":"#4b6878"}]},{"featureType":"landscape.man_made","elementType":"geometry.stroke","stylers":[{"color":"#334e87"}]},{"featureType":"landscape.natural","elementType":"geometry","stylers":[{"color":"#023e58"}]},{"featureType":"poi","elementType":"geometry","stylers":[{"color":"#283d6a"}]},{"featureType":"poi","elementType":"labels.text.fill","stylers":[{"color":"#6f9ba5"}]},{"featureType":"poi","elementType":"labels.text.stroke","stylers":[{"color":"#1d2c4d"}]},{"featureType":"poi.park","elementType":"geometry.fill","stylers":[{"color":"#023e58"}]},{"featureType":"poi.park","elementType":"labels.text.fill","stylers":[{"color":"#3C7680"}]},{"featureType":"road","elementType":"geometry","stylers":[{"color":"#304a7d"}]},{"featureType":"road","elementType":"labels.text.fill","stylers":[{"color":"#98a5be"}]},{"featureType":"road","elementType":"labels.text.stroke","stylers":[{"color":"#1d2c4d"}]},{"featureType":"road.highway","elementType":"geometry","stylers":[{"color":"#2c6675"}]},{"featureType":"road.highway","elementType":"geometry.stroke","stylers":[{"color":"#255763"}]},{"featureType":"road.highway","elementType":"labels.text.fill","stylers":[{"color":"#b0d5ce"}]},{"featureType":"road.highway","elementType":"labels.text.stroke","stylers":[{"color":"#023e58"}]},{"featureType":"transit","elementType":"labels.text.fill","stylers":[{"color":"#98a5be"}]},{"featureType":"transit","elementType":"labels.text.stroke","stylers":[{"color":"#1d2c4d"}]},{"featureType":"transit.line","elementType":"geometry.fill","stylers":[{"color":"#283d6a"}]},{"featureType":"transit.station","elementType":"geometry","stylers":[{"color":"#3a4762"}]},{"featureType":"water","elementType":"geometry","stylers":[{"color":"#0e1626"}]},{"featureType":"water","elementType":"labels.text.fill","stylers":[{"color":"#4e6d70"}]}]');
    });
  }

  void showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'DISCLAIMER',
          style: AppStyle.textMain,
        ),
        content: Container(
          height: 210.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 9 / 10,
                height: 140.0,
                child: PageView(
                  controller: controller,
                  children: <Widget>[
                    Text(
                      'Titik merah bukan titik persis lokasi pasien positif Covid-19 namun diacak oleh system dalam radius 1 km dari alamat domisili pasien di area kecamatan tersebut.',
                      style: AppStyle.textSubMain,
                    ),
                    Text(
                      'Perbedaan data yang di informasikan di halaman utama dan Radar COVID-19 ini mungkin terjadi karena proses perbaruan data membutuhkan waktu sinkronisasi 1-2 hari.',
                      style: AppStyle.textSubMain,
                    ),
                    Text(
                      'Update kapasitas RS dapat dilakukan secara realtime oleh Rumah Sakit. Untuk konfirmasi langsung dapat menghubungi nomer terlampir di tiap RS.',
                      style: AppStyle.textSubMain,
                    ),
                    Text(
                      'Sumber data : "https://radarcovid19.jatimprov.go.id/"\nTetap Jaga Kesehatan yaa, ingat #dirumahaja',
                      style: AppStyle.textSubMain,
                    ),
                  ],
                ),
              ),
              Center(
                child: Container(
                  height: 10.0,
                  child: SmoothPageIndicator(
                    controller: controller,
                    count: 4,
                    effect: ExpandingDotsEffect(),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              FlatButton(
                child: new Text("Lihat Peta"),
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
