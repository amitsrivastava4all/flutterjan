import 'dart:io';
class AgeException implements Exception {
  String _msg;
  AgeException([String msg]){
    this._msg = msg;
  }
  @override
  String toString() {
    _msg= _msg??"Age Can't Be Less than 18";
    return _msg;
  }
}
void main(){
  print("Enter the Age");
  int age = int.parse(stdin.readLineSync());
  try{
  if(age<18){
    throw new AgeException("mfgxdhjgfjhdhjfhjs");
  }
  print("U r Valid for Voter Id Card");
  } on AgeException catch(e,s){
    print(e); // e.toString()
    //print(e.runtimeType.runtimeType);
   // print("Age Can't be less than 18 "+e.toString());
  }

}