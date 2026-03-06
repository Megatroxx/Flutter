import 'package:flutter/material.dart';

import '../../core/models/application.dart';
import '../../core/models/job.dart';

class ApplicationsProvider extends ChangeNotifier {
  final List<Application> _applications = [];

  List<Application> get applications => List.unmodifiable(_applications);

  bool hasApplied(Job job) {
    return _applications.any((item) => item.job.id == job.id);
  }

  void addApplication({
    required Job job,
    required String fullName,
    required String phone,
    String message = '',
  }) {
    final application = Application(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      job: job,
      appliedAt: DateTime.now(),
      fullName: fullName.trim(),
      phone: phone.trim(),
      message: message.trim(),
    );

    _applications.insert(0, application);
    notifyListeners();
  }
}