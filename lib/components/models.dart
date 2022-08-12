class TodoModel {
  final String todo_id;
  final String todo_title;
  final String todo_description;
  bool isDone;
  
  TodoModel({
    required this.todo_id,
    required this.todo_title,
    required this.todo_description,
    this.isDone = false,
  });
}
