import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_assignments/assignment7/todo_list_screen.dart';

void main() {
  group('TodoListProviderScreen widget', () {
    testWidgets('adding a task shows it in the list', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: TodoListProviderScreen()));

      await tester.enterText(find.byType(TextField), 'Buy milk');
      await tester.tap(find.text('Add'));
      await tester.pump();

      expect(find.text('Buy milk'), findsOneWidget);
    });

    testWidgets('tapping checkbox toggles completion', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: TodoListProviderScreen()));

      await tester.enterText(find.byType(TextField), 'Task');
      await tester.tap(find.text('Add'));
      await tester.pump();

      final checkbox = find.byType(Checkbox).first;
      expect(tester.widget<Checkbox>(checkbox).value, isFalse);

      await tester.tap(checkbox);
      await tester.pump();

      expect(tester.widget<Checkbox>(checkbox).value, isTrue);
    });

    testWidgets('delete icon removes the task', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: TodoListProviderScreen()));

      await tester.enterText(find.byType(TextField), 'Task');
      await tester.tap(find.text('Add'));
      await tester.pump();

      await tester.tap(find.byIcon(Icons.delete).first);
      await tester.pumpAndSettle();

      expect(find.text('Task'), findsNothing);
    });
  });
}
