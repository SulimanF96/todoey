
import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:todoey/models/task.dart';

class TasksProvider extends ChangeNotifier{
  List<Task> _tasks = [Task(name: 'to do 1'), Task(name: 'to do 2'), Task(name: 'to do 3')];

  int get tasksCount => _tasks.length;
  UnmodifiableListView get tasks => UnmodifiableListView(_tasks);

  void addNewTask(String task){
    _tasks.add(Task(name: task));
    notifyListeners();
  }

  void toggleTask(int index){
    _tasks[index].toggleChecbox();
    notifyListeners();
  }

  void removeTask(int index){
    _tasks.removeAt(index);
  }


}
