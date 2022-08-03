import 'package:task1/employee.dart';

class Flutter extends Employee {
  double salary = 5000;
  double bouns = 1000;

  Flutter() {
    Emp(salary, bouns);
  }

  @override
  Emp(double salary, double bouns) {
    print("The Employee Salary Is $salary ");
    print("The Employee Bouns Is $bouns ");
  }
}
