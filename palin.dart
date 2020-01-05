void main()
{
  
  print("palindrone is : "+ palindrone("amit").toString());
  
}
bool palindrone(String str)
{
  int len= str.length;
  List<int> chars=str.runes.toList();
  int len2  = len -1 ;
  for(int i=0;i<(len/2);i++)
  {
    print("1st char is ${chars[i].toString()} and 2nd char is ${chars[len2-i].toString()}" );
    if(chars[i]!=chars[len2-i])
    return false;
  }
  return true; 
  
}
