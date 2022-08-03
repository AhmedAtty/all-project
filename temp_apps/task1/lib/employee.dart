import 'package:task1/project.dart';

abstract class Employee {
  Emp(double salary, double bouns);

  // var p = Project(
  //     Finshed: true,
  //     progectName: 'firstP',
  //     programingLanguge: 'flutter',
  //     WorkHours: 20);

  List<Project> Projects = [
    Project(
        Finshed: true,
        progectName: 'firstP',
        programingLanguge: 'flutter',
        WorkHours: 20),
    Project(
        Finshed: true,
        progectName: 'firstP',
        programingLanguge: 'flutter',
        WorkHours: 20),
  ];
  printProj(){
    for(var i in Projects){
      print(i.Finshed);
      print(i.progectName);
      print(i.programingLanguge);
      print(i.WorkHours);
    }
  }


}
