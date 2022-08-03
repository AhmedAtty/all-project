import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo/db/db_helper.dart';
import 'package:todo/models/task.dart';

class TaskController extends GetxController {
  final RxList<Task> taskList = <Task>[].obs;

  Future<int> addTask({Task? task}) {
    return DBHelper.insert(task);
  }

//الحصول علي الداتا من الداتا بيز geting data from data base
  Future<void> getTasks() async {
    final List<Map<String, Object?>> tasks = await DBHelper.query();
    taskList.assignAll(tasks.map((data) => Task.fromJson(data)).toList());
  }

// delete data from data base
  void deleteTasks(Task task) async {
    await DBHelper.delete(task);
    //getTasks(); to update data after deleting
    getTasks();
  }

  deleteAllTasks()async{
    await DBHelper.deleteAll();
    getTasks();
  }

// markTaskCompleted data
  void markTaskCompleted(int id) async {
    await DBHelper.update(id);
    getTasks();
  }
}
