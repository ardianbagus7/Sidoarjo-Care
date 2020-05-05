
import 'package:http/http.dart';
import 'package:html/parser.dart';

class Helper {
  Client client;

  Helper() {
    client = Client();
  }

  Future<List> initiate() async {
    List<String> data = [];
    var client = Client();
    var response =
        await client.get('https://covid19.sidoarjokab.go.id/');
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
    data.add(positif);
    data.add(sembuh);
    data.add(meninggal);
    data.add(odp);
    data.add(pdp);
    data.add(update);
    return data;
  }
}
