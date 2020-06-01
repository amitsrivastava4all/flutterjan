import 'dart:async';

import 'package:http/http.dart' as http;

class Server {
  static String apiKey = "A8zoDoPaQgefmB7KunnSuApSgL73";
  static Future<http.Response> playerInfo(int pid) {
    var url = 'https://cricapi.com/api/playerStats?pid=$pid&apikey=$apiKey';
    Future<http.Response> future = http.get(url);
    return future;
  }

  static Future<http.Response> getNews([String country]) {
    country = country ?? 'in';
    var url =
        'https://newsapi.org/v2/top-headlines?country=${country}&apiKey=bd1ee0fb430647729e10fd610cb10cef';
    Future<http.Response> future = http.get(url);
    return future;
  }

  static Future<http.Response> getPlayerId(String name) {
    var url = 'https://cricapi.com/api/playerFinder?name=$name&apikey=$apiKey';
    Future<http.Response> future = http.get(url);
    return future;
  }
}
