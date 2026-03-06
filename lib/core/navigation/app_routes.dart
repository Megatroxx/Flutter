import 'package:flutter/material.dart';

import '../../features/jobs/jobs_screen.dart';
import '../../features/job-detail/job_detail_screen.dart';
import '../../features/favorites/favorites_screen.dart';
import '../models/job.dart';

class AppRoutes {
  static const jobs = '/';
  static const favorites = '/favorites';
  static const jobDetail = '/job-detail';

  static Route<dynamic> onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case jobs:
        return MaterialPageRoute(
          builder: (_) => const JobsScreen(),
        );

      case favorites:
        return MaterialPageRoute(
          builder: (_) => const FavoritesScreen(),
        );

      case jobDetail:
        final job = settings.arguments as Job;

        return MaterialPageRoute(
          builder: (_) => JobDetailScreen(),
          settings: RouteSettings(arguments: job),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const JobsScreen(),
        );
    }
  }
}