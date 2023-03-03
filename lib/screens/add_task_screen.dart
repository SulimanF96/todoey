import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/providers/tasks_provider.dart';


class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {

  String todoName = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF757575),
      child: Container(
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))),
        child: Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [
              Text("Add Task", textAlign: TextAlign.center, style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.lightBlueAccent),),
              TextField(autofocus: true, textAlign: TextAlign.center, onChanged: (value){
                setState(() {
                  todoName = value;
                });
              },),
              SizedBox(height:20 ),
              MaterialButton(onPressed: (){
                Provider.of<TasksProvider>(context, listen: false).addNewTask(todoName);
                Navigator.pop(context);
              }, child: Text("Add", style: TextStyle(color: Colors.white),), color: Colors.lightBlueAccent)
            ],
          ),
        ),
      ),
    );
  }
}
