import 'dart:convert';
import 'package:http/http.dart' as http;

class User
{
  String name;
  String positif;
  String sembuh;
  String meninggal;

  User({this.name,this.positif,this.sembuh,this.meninggal});

  factory User.createUser(Map<String, dynamic> object)
  {
    return User(
      name: object['name'],
      positif: object['positif'].toString(),
      sembuh: object['sembuh'].toString(),
      meninggal: object['meninggal'].toString(),
    );
  }

  static Future<User> connectToAPI() async
  {
    String apiURL = "https://api.kawalcorona.com/indonesia";
    var apiResult = await http.get(apiURL);
    var jsonObject = json.decode(apiResult.body);
    print(jsonObject);
    return User.createUser(jsonObject[0]);
  }
}