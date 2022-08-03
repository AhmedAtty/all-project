import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:student_list_sqf/screens/student_detil.dart';

import 'dart:async';

import '../models/student.dart';
import '../utilities/sql_helper.dart';


class StudentsList extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {

    // TODO: implement createState
    return StudentsState();
  }
}

class StudentsState extends State<StudentsList>{
  SQL_Helper helper = SQL_Helper();
  List<Student>? studentList;
  int count =0;
  @override
  Widget build(BuildContext context) {

    if(studentList==null)  {
      studentList=<Student>[];
      updateListView();
}
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Students"),
        ),
        body: getStudentsList(),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            navigateToStudent(Student(0,"","",1,"",),"Add New Student");
          },
          tooltip: 'Add Student',
          child: Icon(Icons.add),
        )
    );
  }

  ListView getStudentsList(){

    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int position){
          return Card (
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: ispassed(this.studentList![position].pass),
                child: getIcon(this.studentList![position].pass),
              ),
              title: Text(this.studentList![position].name),
              subtitle: Text(this.studentList![position].description+" | "+this.studentList![position].date),
              trailing:
                  GestureDetector(child: Icon(Icons.delete, color: Colors.grey,),
                    onTap: (){
                    _delete(context, this.studentList![position]);
                    },
                  ),
              onTap: (){
                navigateToStudent(this.studentList![position],"Edit Student");
              },
            ),

          );

        });
  }

  void navigateToStudent(Student student,String appTitle)async{
    bool result = await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return StudentDetail( student ,appTitle);

    }));
    if(result){
      updateListView();
    }
  }
  Color ispassed(int value){
    switch(value){
      case 1:
      return Colors.amber;
      break;
      case 2:
        return Colors.red;
        break;
      default:
        return Colors.amber;
    }
  }
  Icon getIcon (int value){
    switch(value){
      case 1:
        return Icon(Icons.check);
        break;
      case 2:
        return Icon(Icons.close);
        break;
      default:
        return Icon(Icons.check);
    }
  }
  void _delete(BuildContext context,Student student) async{
    int resulte= await helper.deleteStudent(student.id);
    // if(resulte!=0){
    //   _showSnachBar(context, "has been deleted");
    //   updateListView();
    // }

  }
  // void _showSnachBar(BuildContext context,String msg){
  //   final snackBar=SnackBar(content :Text (msg),);
  //   Scaffold.of(context).showSnackBar(snackBar);
  // }
  void updateListView(){

    final Future<Database> db = helper.initializedDatabase();
    db.then((database){

      Future<List<Student>> students = helper.getStudentList();
      students.then((theList) {
        setState(() {
          this.studentList= theList;
          this.count = theList.length;
        });
      } );
    });


  }
}