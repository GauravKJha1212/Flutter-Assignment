import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:flutter_assignments/dailywellness/screens/add_activity_screen.dart';
import 'package:flutter_assignments/dailywellness/providers/activity_provider.dart';

void main() {
  testWidgets('shows error when name is empty', (tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => ActivityProvider(),
        child: const MaterialApp(home: AddActivityScreen()),
      ),
    );

    await tester.tap(find.text('Save'));
    await tester.pump();

    expect(find.text('Activity name is required'), findsOneWidget);
  });
}
