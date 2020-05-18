import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart';

class SidoarjoProvider with ChangeNotifier {
  List<String> data = null;
  Future<List> getSidoarjoProvider() async {
    List<String> _data = [];
    var response = await http.get('https://covid19.sidoarjokab.go.id/');
    if (response.statusCode == 200) {
      notifyListeners();
      var document = parse(response.body);
      final mangasPerTitle = document.getElementById('informasi-kasus');
      final updates = mangasPerTitle.getElementsByTagName('h5')[0];
      final positifs = mangasPerTitle.getElementsByTagName('b')[1];
      final sembuhs = mangasPerTitle.getElementsByTagName('b')[3];
      final meninggals = mangasPerTitle.getElementsByTagName('b')[5];
      final odps = mangasPerTitle.getElementsByTagName('b')[6];
      final pdps = mangasPerTitle.getElementsByTagName('b')[7];
      var positif = positifs.text.trim();
      var sembuh = sembuhs.text.trim();
      var meninggal = meninggals.text.trim();
      var odp = odps.text.trim();
      var pdp = pdps.text.trim();
      var update = updates.text.trim();
      _data.add(positif);
      _data.add(sembuh);
      _data.add(meninggal);
      _data.add(odp);
      _data.add(pdp);
      _data.add(update);
      data = _data;
      print('DATA SIDOARJO SUKSES');
      return _data;
    } else {
      data = null;
      return null;
    }
  }
}
