import 'package:flutter/material.dart';
import 'core/navigation/app_routes.dart';
import 'features/jobs/jobs_screen.dart';
import 'features/job-detail/job_detail_screen.dart';

void main() {
  runApp(const WorksAggregatorApp());
}

class WorksAggregatorApp extends StatelessWidget {
  const WorksAggregatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Works Aggregator',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.jobs,
      routes: {
        AppRoutes.jobs: (_) => const JobsScreen(),
        AppRoutes.jobDetail: (_) => const JobDetailScreen(),
      },
    );
  }
}