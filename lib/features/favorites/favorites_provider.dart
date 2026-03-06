import 'package:flutter/material.dart';
import '../../core/models/job.dart';

class FavoritesProvider extends ChangeNotifier {
  final List<Job> _favorites = [];

  List<Job> get favorites => List.unmodifiable(_favorites);

  bool isFavorite(Job job) {
    return _favorites.any((item) => item.id == job.id);
  }

  void toggleFavorite(Job job) {
    if (isFavorite(job)) {
      _favorites.removeWhere((item) => item.id == job.id);
    } else {
      _favorites.add(job);
    }

    notifyListeners();
  }
}