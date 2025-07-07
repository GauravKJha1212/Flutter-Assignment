import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_assignments/dailywellness/providers/activity_provider.dart';

void main() {
  group('ActivityProvider', () {
    late ActivityProvider provider;

    setUp(() {
      provider = ActivityProvider();
    });

    test('initial activities length', () {
      expect(provider.activities.length, 3);
    });

    test('add adds an activity', () {
      provider.add('Jogging');
      expect(provider.activities.last.name, 'Jogging');
    });
  });
}
