
Future<List<String>> getNames() {
  // DB + Network + file
//  Future<List<String>> l = Future(() {
//    List<String> l = ["Hello", "Hi", "Ok"];
//    return l;
//  });
  Future<List<String>> f = Future.delayed(Duration(seconds: 3), () {
    print("I am call after 3 sec");
    var list = giveNames();
    print("NAmes are $list");
    return giveNames();
  });
  return f;
}

giveNames() {
  List<String> l = ["Hello", "Hi", "Ok"];
  return l;
}
void main(){
  print("inside main....");
  var tt = getNames();
  print("After GetNames $tt");
  tt.then((data){
    print("Here is Data $data");
  }).catchError((err){
    print("Error is $err");
  });

}