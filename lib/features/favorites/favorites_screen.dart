import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/navigation/app_routes.dart';
import '../../core/models/job.dart';
import '../jobs/widgets/job_card.dart';
import 'favorites_provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  void _openDetails(BuildContext context, Job job) {
    Navigator.pushNamed(
      context,
      AppRoutes.jobDetail,
      arguments: job,
    );
  }

  @override
  Widget build(BuildContext context) {
    final favorites = context.watch<FavoritesProvider>().favorites;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Избранные вакансии'),
      ),
      body: favorites.isEmpty
          ? const Center(
        child: Text(
          'Вы ещё не добавили вакансии в избранное',
          style: TextStyle(fontSize: 16),
        ),
      )
          : ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          final job = favorites[index];

          return JobCard(
            job: job,
            onTap: () => _openDetails(context, job),
          );
        },
      ),
    );
  }
}