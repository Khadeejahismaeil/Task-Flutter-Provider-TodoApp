// provider/todo_provider.dart (New file)

import 'package:flutter/material.dart';
import '../models/todo.dart'; // Import the Todo model

class TodoProvider extends ChangeNotifier
//3. Create your provider that extends `ChangeNotifier`.
{
  List<Todo> todos = [
    // 4.Create a todos list
    Todo(id: 1, title: "First"), // 4.Initialize with a sample todo
  ];

//5. Back to our `todo_provider.dart`,
//let's create a method `addTodo` for adding a `todo`,
//this method will take a `String` `title` argument,
//and will generate an `id` for our `todo`,
//then we will insert this new to do to our `todos` list.
  void addTodo(String title) {
    final newTodo =
        Todo(id: DateTime.now().millisecondsSinceEpoch, title: title);
    todos.add(newTodo);
    notifyListeners(); // 6. Don't forget to call `notifyListeners()`.
  }

  void toggleTodoDone(int id) {
    final index = todos.indexWhere((todo) => todo.id == id);
    if (index != -1) {
      todos[index].done = !todos[index].done;
      notifyListeners(); //11. Don't forget to call `notifyListeners()`.
    } /*10. First, we need to create a method for that in our `todo_provider.dart`, 
this method takes an `id` as an argument, 
and looks for the `todo` with the same `id` within our `todos` list, 
and switch it's `done` property value to `true` or `false`.*/
  }
}
