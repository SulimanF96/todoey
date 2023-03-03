import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/providers/tasks_provider.dart';
import 'package:todoey/widgets/task_tile.dart';


class TasksList extends StatelessWidget {
  const TasksList();


  @override
  Widget build(BuildContext context) {
    return Consumer<TasksProvider>(builder: (context, tasksData, child){
      return ListView.builder(itemBuilder: (context, index){
        return TaskTile(isChecked: tasksData.tasks[index].isChecked, name: tasksData.tasks[index].name, toggleCheckbox: (value) => Provider.of<TasksProvider>(context, listen: false).toggleTask(index), longPressCallback: (){
          Provider.of<TasksProvider>(context).removeTask(index);
        },);
      }, itemCount: tasksData.tasksCount);
    });
  }
}


