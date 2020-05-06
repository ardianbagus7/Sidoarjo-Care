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
    var response = await client.get('https://covid19.sidoarjokab.go.id/');
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

    var response2 = await client.get('https://covid19.go.id/');
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

    data.add(positif);
    data.add(sembuh);
    data.add(meninggal);
    data.add(odp);
    data.add(pdp);
    data.add(update);
    
    data.add(updateindo);
    data.add(positifindo);
    data.add(sembuhindo);
    data.add(meninggalindo);

    return data;
  }
}
