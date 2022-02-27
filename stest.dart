import 'package:equatable/equatable.dart';

void main (){
     var person = Person ();
     person.age  = 151 ;
     person.name  = '15' ;


     var person2 = Person ();
     person2.age  = 15 ;
     person2.name  = '15' ;
     print(person2 == person);
}


class Person extends Equatable{

  int ?  age ;
  String ?  name;

  @override
  // TODO: implement props
  List<Object?> get props => [name,age];


}