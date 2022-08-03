import 'employee.dart';

class Android extends Employee{
  double salary = 4000;
  double bouns = 500;

  Android() {
    Emp(salary, bouns);
  }

  @override
  Emp(double salary, double bouns) {
    print("The Employee Salary Is $salary ");
    print("The Employee Bouns Is $bouns ");
  }
}