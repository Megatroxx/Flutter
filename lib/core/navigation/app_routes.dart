import 'package:flutter/material.dart';

import '../../features/applications/applications_screen.dart';
import '../../features/applications/apply_form_screen.dart';
import '../../features/favorites/favorites_screen.dart';
import '../../features/job-detail/job_detail_screen.dart';
import '../../features/jobs/jobs_screen.dart';
import '../models/job.dart';

class AppRoutes {
  static const jobs = '/';
  static const favorites = '/favorites';
  static const applications = '/applications';
  static const jobDetail = '/job-detail';
  static const applyForm = '/apply-form';

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

      case applications:
        return MaterialPageRoute(
          builder: (_) => const ApplicationsScreen(),
        );

      case jobDetail:
        final job = settings.arguments as Job;
        return MaterialPageRoute(
          builder: (_) => JobDetailScreen(job: job),
        );

      case applyForm:
        final job = settings.arguments as Job;
        return MaterialPageRoute(
          builder: (_) => ApplyFormScreen(job: job),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const JobsScreen(),
        );
    }
  }
}