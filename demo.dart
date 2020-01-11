void main(){
  show(output);
}
void show(Function fun){
  print("I am in Show");
  fun();
}
void output(){
  print("I am in output");
}