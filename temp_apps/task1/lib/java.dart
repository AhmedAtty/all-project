import 'employee.dart';

class Java extends Employee{
  double salary = 3000;
  double bouns = 300;

  Java() {
    Emp(salary, bouns);
  }

  @override
  Emp(double salary, double bouns) {
    print("The Employee Salary Is $salary ");
    print("The Employee Bouns Is $bouns ");
  }
}