import 'package:http/http.dart' as http;

class Server {
  static getHeadLines(String country, Function fn) {
    String apiKey = "11f0dc28d8874be0bb82287cbcf26121";
    String url =
        "http://newsapi.org/v2/top-headlines?country=$country&apiKey=$apiKey";
    Future future = http.get(url);
    // http.post
    Map<String, String> body = {"userid": "ram", "pwd": "123"};
    //Future future2 = http.post(url,body: body);
    // http.delete(url)
    //http.put(url)
    future.then((response) {
      fn(response);
      print("Response is $response");
    }).catchError((err) {
      print("Error is $err");
    });
  }
}
