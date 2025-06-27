import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_assignments/main.dart';

void main() {
  testWidgets('Follow button toggles text', (tester) async {
    // Build top–level app.
    await tester.pumpWidget(const ProfileCardDemo());

    // Ensure the initial state is “Follow”.
    expect(find.text('Follow'), findsOneWidget);
    expect(find.text('Following'), findsNothing);

    // Tap the button and trigger rebuild.
    await tester.tap(find.byType(FilledButton));
    await tester.pump(); // re-render after setState

    // Now the text should flip.
    expect(find.text('Follow'), findsNothing);
    expect(find.text('Following'), findsOneWidget);
  });
}
