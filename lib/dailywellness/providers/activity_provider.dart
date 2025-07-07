import 'package:flutter/foundation.dart';

import '../models/activity.dart';

class ActivityProvider extends ChangeNotifier {
  final List<Activity> _activities = [
    Activity(name: 'Drink water'),
    Activity(name: 'Meditate'),
    Activity(name: 'Walk'),
  ];

  List<Activity> get activities => List.unmodifiable(_activities);

  void add(String name, {String? notes}) {
    _activities.add(Activity(name: name, notes: notes));
    notifyListeners();
  }
}
