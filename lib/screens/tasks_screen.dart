import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:todoey/main.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/providers/auth_provider.dart';
import 'package:todoey/providers/tasks_provider.dart';
import 'package:todoey/screens/add_task_screen.dart';
import 'package:todoey/screens/auth_screen.dart';
import 'package:todoey/widgets/tasks_list.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(backgroundColor: Colors.lightBlueAccent, onPressed: (){
        showModalBottomSheet(context: context, builder: (context) => AddTaskScreen());
      }, child: Icon(Icons.add),),
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Container(
          padding:
          EdgeInsets.only(top: 60.0, left: 30.0, bottom: 30.0, right: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30.0,
                    child: Icon(
                      Icons.list,
                      size: 30.0,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                  GestureDetector(
                    onTap:  Provider.of<AuthModel>(context).isAuthorized ? (){
                       Provider.of<AuthModel>(context, listen: false).logout();
                    } : ()  {
                      showModalBottomSheet(context: context, builder: (context) => AuthScreen());
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30.0,
                      child: Icon(
                        Provider.of<AuthModel>(context).isAuthorized ? Icons.logout: Icons.login,
                        size: 30.0,
                        color: Colors.lightBlueAccent,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Todoey",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                '${Provider.of<TasksProvider>(context).tasksCount} tasks',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),

            ],
          ),
        ),  Expanded(child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          height: 300.0,
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))),
          child: TasksList(),
        ))],
      ),
    );;
  }
}







