import 'dart:io';
import 'dart:convert';
void main(){
  const url = "https://cricapi.com/api/matches/A8zoDoPaQgefmB7KunnSuApSgL73";
  var future = HttpClient().getUrl(Uri.parse(url));
  future.then((req){
      return req.close();
  }).then((res){
    print("Res is $res");
    res.transform(Utf8Decoder()).listen((data){
      print("Data is $data");
    }).onError((err){
      print("Error is $err");
    }
    );
  }).catchError((err){
    print("Error is $err");
  });
}