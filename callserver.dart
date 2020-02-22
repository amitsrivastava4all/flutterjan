import 'package:http/http.dart' as http;

class Server {
  getHeadLines(String country) {
    String apiKey = "11f0dc28d8874be0bb82287cbcf26121";
    String url =
        "http://newsapi.org/v2/top-headlines?country=$country&apiKey=$apiKey";
    Future future = http.get(url);
    future.then((response) {
      print("Response is $response");
    }).catchError((err) {
      print("Error is $err");
    });
  }
}
