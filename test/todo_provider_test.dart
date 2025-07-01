import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_assignments/assignment7/models/todo.dart';
import 'package:flutter_assignments/assignment7/providers/todo_provider.dart';

void main() {
  group('Todo', () {
    test('defaults to not completed', () {
      final todo = Todo(title: 'task');
      expect(todo.title, 'task');
      expect(todo.isCompleted, isFalse);
    });
  });

  group('TodoProvider', () {
    late TodoProvider provider;

    setUp(() {
      provider = TodoProvider();
    });

    test('add inserts a todo', () {
      provider.add('one');
      expect(provider.todos, hasLength(1));
      expect(provider.todos.first.title, 'one');
    });

    test('toggle switches completion state', () {
      provider.add('task');
      expect(provider.todos.first.isCompleted, isFalse);

      provider.toggle(0);
      expect(provider.todos.first.isCompleted, isTrue);

      provider.toggle(0);
      expect(provider.todos.first.isCompleted, isFalse);
    });

    test('remove deletes the todo', () {
      provider.add('task');
      provider.remove(0);
      expect(provider.todos, isEmpty);
    });
  });
}
