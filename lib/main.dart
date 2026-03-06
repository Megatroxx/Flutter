import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/navigation/app_routes.dart';

import 'features/jobs/jobs_screen.dart';
import 'features/job-detail/job_detail_screen.dart';
import 'features/favorites/favorites_screen.dart';
import 'features/favorites/favorites_provider.dart';

void main() {
  runApp(const JobsApp());
}

class JobsApp extends StatelessWidget {
  const JobsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FavoritesProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Job Aggregator',

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