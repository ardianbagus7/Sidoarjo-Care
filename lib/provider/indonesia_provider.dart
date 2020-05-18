import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart';

class IndonesiaProvider with ChangeNotifier {
  List<String> data = null;
  Future<List> getIndonesiaProvider() async {
    List<String> _data = [];
    var response2 = await http.get('https://covid19.go.id/');
    if (response2.statusCode == 200) {
      notifyListeners();
      var document2 = parse(response2.body);
      final mangasPerTitle2 = document2.getElementById('case');
      final indopositifs = mangasPerTitle2.getElementsByTagName('strong')[3];
      final indosembuhs = mangasPerTitle2.getElementsByTagName('strong')[4];
      final indomeninggals = mangasPerTitle2.getElementsByTagName('strong')[5];
      final updateindos = mangasPerTitle2.getElementsByTagName('div')[13];
      var positifindo = indopositifs.text.trim();
      var sembuhindo = indosembuhs.text.trim();
      var meninggalindo = indomeninggals.text.trim();
      var updateindo = updateindos.text.trim();
      _data.add(updateindo);
      _data.add(positifindo);
      _data.add(sembuhindo);
      _data.add(meninggalindo);
      data = _data;
      print('DATA INDO SUKSES');
      return _data;
    } else {
      data = null;
      return null;
    }
  }
}
