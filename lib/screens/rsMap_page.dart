import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RSMAP extends StatefulWidget {
  @override
  _RSMAPState createState() => _RSMAPState();
}

class _RSMAPState extends State<RSMAP> {
  List<Marker> allMarkers = <Marker>[];

  GoogleMapController _controller;

  @override
  void initState() {
    allMarkers.add(
      Marker(
        markerId: MarkerId('RSUD Sidoarjo'),
        draggable: false,
        onTap: () {
          print('marker tapped');
        },
        position: LatLng(-7.4654, 112.7164),
      ),
    );
    allMarkers.add(
      Marker(
        markerId: MarkerId('RS Siti Hajar'),
        draggable: false,
        onTap: () {
          print('marker tapped');
        },
        position: LatLng(-7.4576, 112.7219),
      ),
    );
    allMarkers.add(
      Marker(
        markerId: MarkerId('RS Mitra Keluarga'),
        draggable: false,
        onTap: () {
          print('marker tapped');
        },
        position: LatLng(-7.3626, 112.7286),
      ),
    );
    allMarkers.add(
      Marker(
        markerId: MarkerId('RS Anwar Medika'),
        draggable: false,
        onTap: () {
          print('marker tapped');
        },
        position: LatLng(-7.4096, 112.5570),
      ),
    );
    super.initState();
  }

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
                            'Pusat Bantuan',
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
                            initialCameraPosition: CameraPosition(
                                target: LatLng(-7.4462, 112.7178), zoom: 12.0),
                            markers: Set<Marker>.of(allMarkers),
                            onMapCreated: mapCreated,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox.expand(
                    child: DraggableScrollableSheet(
                      initialChildSize: 0.20,
                      minChildSize: 0.12,
                      maxChildSize: 0.5,
                      builder: (BuildContext c, s) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFF1F4FC),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 10.0,
                              )
                            ],
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 10,
                            ),
                            child: ListView(
                              controller: s,
                              children: <Widget>[
                                Center(
                                  child: Container(
                                    height: 7.0,
                                    width: 45.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF5145FF),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(100.0)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Text(
                                  'Cari Rumah Sakit Rujukan',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Color(0xFF180A05),
                                    ),
                                    fontSize: 20,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Material(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  child: ListTile(
                                    leading: Icon(
                                      Icons.place,
                                      color: Color(0xFF5145FF),
                                    ),
                                    title: Wrap(
                                      direction: Axis.vertical,
                                      children: <Widget>[
                                        Text(
                                          'RSUD Sidoarjo',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: Color(0xFF180A05),
                                            ),
                                            fontSize: 20,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text('(031) 896164'),
                                      ],
                                    ),
                                    trailing: Icon(
                                      Icons.search,
                                      color: Color(0xFF5145FF),
                                    ),
                                    onTap: rs1,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Material(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  child: ListTile(
                                      leading: Icon(
                                        Icons.place,
                                        color: Color(0xFF5145FF),
                                      ),
                                      title: Wrap(
                                        direction: Axis.vertical,
                                        children: <Widget>[
                                          Text(
                                            'RS Siti Hajar',
                                            style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                color: Color(0xFF180A05),
                                              ),
                                              fontSize: 20,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text('(031) 892123'),
                                        ],
                                      ),
                                      trailing: Icon(
                                        Icons.search,
                                        color: Color(0xFF5145FF),
                                      ),
                                      onTap: rs2),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Material(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  child: ListTile(
                                    leading: Icon(
                                      Icons.place,
                                      color: Color(0xFF5145FF),
                                    ),
                                    title: Wrap(
                                      direction: Axis.vertical,
                                      children: <Widget>[
                                        Text(
                                          'RS Mitra Keluarga',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: Color(0xFF180A05),
                                            ),
                                            fontSize: 20,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text('(031) 854211'),
                                      ],
                                    ),
                                    trailing: Icon(
                                      Icons.search,
                                      color: Color(0xFF5145FF),
                                    ),
                                    onTap: rs3,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Material(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  child: ListTile(
                                    leading: Icon(
                                      Icons.place,
                                      color: Color(0xFF5145FF),
                                    ),
                                    title: Wrap(
                                      direction: Axis.vertical,
                                      children: <Widget>[
                                        Text(
                                          'RS Anwar Medika',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: Color(0xFF180A05),
                                            ),
                                            fontSize: 20,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text('(031) 897205'),
                                      ],
                                    ),
                                    trailing: Icon(
                                      Icons.search,
                                      color: Color(0xFF5145FF),
                                    ),
                                    onTap: rs4,
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    )));
  }

  void mapCreated(controller) {
    setState(() {
      _controller = controller;
    });
  }

  rs1() {
    _controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: LatLng(-7.4654, 112.7164), zoom: 17.0),
    ));
  }

  rs2() {
    _controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: LatLng(-7.4576, 112.7219), zoom: 17.0),
    ));
  }

  rs3() {
    _controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: LatLng(-7.3626, 112.7286), zoom: 17.0),
    ));
  }

  rs4() {
    _controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: LatLng(-7.4096, 112.5570), zoom: 17.0),
    ));
  }
}
