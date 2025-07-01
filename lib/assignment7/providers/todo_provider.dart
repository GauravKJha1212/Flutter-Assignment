import 'package:flutter/foundation.dart';

import '../models/todo.dart';

/// Manages the list of [Todo] items and notifies listeners when changes occur.
class TodoProvider extends ChangeNotifier {
  final List<Todo> _todos = [];

  /// Unmodifiable view of the current tasks.
  List<Todo> get todos => List.unmodifiable(_todos);

  /// Adds a new task with the given [title].
  void add(String title) {
    _todos.add(Todo(title: title));
    notifyListeners();
  }

  /// Toggles the completion state of the task at [index].
  void toggle(int index) {
    final todo = _todos[index];
    todo.isCompleted = !todo.isCompleted;
    notifyListeners();
  }

  /// Removes the task at [index].
  void remove(int index) {
    _todos.removeAt(index);
    notifyListeners();
  }
}
