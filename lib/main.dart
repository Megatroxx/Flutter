import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/navigation/app_routes.dart';
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
        onGenerateRoute: AppRoutes.onGenerate,
      ),
    );
  }
}