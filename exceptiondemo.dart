void main(){
  var t = [10,20];
  var e = "Amit";
  try{
  int www = int.parse(e);
  print("Inside try");
  if(10>2){
    return ;
  }
  print("Try ends");
   }//on FormatException{
  //   print("Invalid Value to be Parse");
  // }
  on FormatException catch(ex, st){
    print("Exception is $ex");
    print("Stack Trace is $st");
  }
  finally{
    print("Always Execute....");
  }
  //int x = (100/0).toInt();
  //print(t[100]);
  print("Main ends");
}