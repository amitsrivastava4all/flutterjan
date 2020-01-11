import 'dart:async';
import 'dart:io';
void main(){
  print(Directory.current.path);
  print("I am Waiting");
  File file = new File(Directory.current.path+'/abstractdemo.dart');
  if(file.existsSync()){
    //String content = file.readAsStringSync();
    Future<String> future = file.readAsString();
     future.then((content){
      print("Content is $content");
    }).catchError((err){
      print("Error is $err");
    });
    for(int i =1 ; i<=10; i++){
      print("Time Pass $i");
    }
   
  }
}