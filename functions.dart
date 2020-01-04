void main(){
  print(add(100,200));
  print(add(100));
  print(add(9));
  adder(x: 10000, t:2000);
}
double add(int x, [int y=0]){
  return (x + y).toDouble();
}
// int adder([int x, int y , int z, int m, int t]){

// }
int adder({int x:10, int y:4 , int z:0, int m:0, int t:1}){
return x + y + z + m + t;
}