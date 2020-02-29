import 'dart:async';
giveFirst(num){
  return Future.delayed(Duration(seconds: 2),(){
    return num* num * num;
  });
}
giveSecond(num){
  return Future.delayed(Duration(seconds: 3),(){
    return num* num;
  });
}
withFuture(){
  Future future = Future.delayed(Duration(seconds: 3),(){
    print("Async Call");
    throw new Exception("Some Error Occured");
    //return 10000;
    //return Future(()=>1000);
  });
  return future;
}
asyncDemo(success, fail){
  Future.delayed(Duration(seconds: 3),(){
    print("I am in Async Demo");
  //return 100;
  if(10>2){
  success(1000);
  }
  else{
    fail("Error Occur");
  }
  });
  
}
giveMeSecondValue(val){
  print("Second Val is $val");
}
giveMeValue(val){
  print("Value is $val");
  Future.delayed(Duration(seconds: 2),(){
    giveMeSecondValue(900);
  });
}
error(err){
  print("Error is $err");
}
total() async{
  var result = await giveFirst(2);
  result = await giveSecond(result);
  print(result);
}
void main(){
  print("I am Start");
  
  Future future = withFuture();
  future.then((data){
    print("Data is $data");
  }).catchError((err){
    print("Error is $err");
  });
  total();
   //asyncDemo(giveMeValue,error);
  // try{
  // asyncDemo(giveMeValue);
  // }
  // catch(e){

  // }
  //var result = asyncDemo();
  //print("I am End $result");
  print("I am End $future");
}