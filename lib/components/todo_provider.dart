import 'package:flutter/cupertino.dart';
import 'package:workshop_lab_2022/components/models.dart';

class TodoProvider with ChangeNotifier {
  List<TodoModel> _todo_data = [];
  List<TodoModel> get todo_data => _todo_data;

  void addTodo(TodoModel ctx) {
    _todo_data.add(ctx);
    notifyListeners();
  }

  void removeTodo(TodoModel todo) {
    _todo_data =
        _todo_data.where((element) => element.todo_id != todo.todo_id).toList();
    notifyListeners();
  }

  void updateTodo(TodoModel todo) {
    _todo_data[_todo_data
        .indexWhere((element) => element.todo_id == todo.todo_id)] = todo;
    notifyListeners();
  }

  void markasDone(TodoModel todo) {
    _todo_data[
            _todo_data.indexWhere((element) => element.todo_id == todo.todo_id)]
        .isDone = !_todo_data[
            _todo_data.indexWhere((element) => element.todo_id == todo.todo_id)]
        .isDone;
    notifyListeners();
  }
}
