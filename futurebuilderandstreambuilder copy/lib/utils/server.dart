import 'dart:convert' as jsonObject;

import 'package:http/http.dart' as http;

class Server {
  static getDataFromServer(String search) async {
    String url =
        "http://api.giphy.com/v1/gifs/search?q=$search&api_key=vFRSFWo6g7vJ7ZAjt3DMDolU52ORTxwH&limit=10";
    http.Response response = await http.get(url);
    var map = jsonObject.jsonDecode(response.body);
    print("Map Data is ${map['data']}");
    return map['data'];
  }
}
