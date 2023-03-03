import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({required this.isChecked, required this.name, required this.toggleCheckbox, required this.longPressCallback});

  final bool isChecked;
  final String name;

  final Function(bool?) toggleCheckbox;
  final Function longPressCallback;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name , style: TextStyle(fontWeight: FontWeight.bold, decoration: isChecked ? TextDecoration.lineThrough: null)),
      trailing: Checkbox(
        checkColor: Colors.white,
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: (value) => toggleCheckbox(value),
      ),
      onLongPress: (){
        longPressCallback;
      },
    );
  }
}





