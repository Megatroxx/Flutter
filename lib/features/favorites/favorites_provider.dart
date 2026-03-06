import 'package:flutter/material.dart';
import '../../core/models/job.dart';

class FavoritesProvider extends ChangeNotifier {
  final List<Job> _favoriteJobs = [];

  List<Job> get favoriteJobs => List.unmodifiable(_favoriteJobs);

  bool isFavorite(Job job) {
    return _favoriteJobs.any((item) => item.id == job.id);
  }

  void toggleFavorite(Job job) {
    if (isFavorite(job)) {
      _favoriteJobs.removeWhere((item) => item.id == job.id);
    } else {
      _favoriteJobs.add(job);
    }
    notifyListeners();
  }
}