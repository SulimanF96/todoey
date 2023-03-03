class Task{
  String name;
  bool isChecked;

  Task({required this.name,  this.isChecked = false});


  void toggleChecbox(){
    isChecked = !isChecked;
  }
}
