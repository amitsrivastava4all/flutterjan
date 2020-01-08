abstract class Course{
  int duration ;
  double fees;
  String name;
  Course(){

  }
  void details();
}
class ComputerScience extends Course{
  int noOfPracticals;
  ComputerScience():super(){

  }
  @override
  void details(){
    print("Computer Science COurse Details");
  }
}
class MangementCourse extends Course{
 int noOfCaseStudies;
 @override
 void details(){
   print("Management Course details");
 }
}
void main(){
 // Course c = new Course();
 ComputerScience cs = new ComputerScience();
}