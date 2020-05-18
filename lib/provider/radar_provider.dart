import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart';
import 'package:sidoarjocovid/model/radar_model.dart';
import 'dart:convert';

class RadarProvider with ChangeNotifier {
  List<DataSidoarjo> radar = null;

  Future<List> getRadarProvider() async {
    List<DataSidoarjo> _data = [];
    var response = await http.get('https://radarcovid19.jatimprov.go.id');
    if (response.statusCode == 200) {
      notifyListeners();
      var document = response.body;
      List<String> df = document.split("var datapositiflatlon=");
      df = df[1].split(";");
      var datapositif = json.decode(df[0]);
      var positif =
          datapositif.where((b) => b["kabkota"] == "KAB. SIDOARJO").toList();
      for (int i = 0; i < positif.length; i++) {
        DataSidoarjo rawdata = DataSidoarjo.fromJson(positif[i]);
        _data.add(rawdata);
        radar = _data;
      }
      print("DATA RADAR SUKSES");
      return _data;
    } else {
      radar = null;
      return null;
    }
  }
}
