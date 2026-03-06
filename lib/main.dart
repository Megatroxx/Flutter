import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/navigation/app_routes.dart';
import 'features/favorites/favorites_provider.dart';
import 'features/favorites/favorites_screen.dart';
import 'features/job-detail/job_detail_screen.dart';
import 'features/jobs/jobs_screen.dart';

void main() {
  runApp(const WorksAggregatorApp());
}

class WorksAggregatorApp extends StatelessWidget {
  const WorksAggregatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FavoritesProvider(),
      child: MaterialApp(
        title: 'Works Aggregator',
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.jobs,
        routes: {
          AppRoutes.jobs: (_) => const JobsScreen(),
          AppRoutes.jobDetail: (_) => const JobDetailScreen(),
          AppRoutes.favorites: (_) => const FavoritesScreen(),
        },
      ),
    );
  }
}