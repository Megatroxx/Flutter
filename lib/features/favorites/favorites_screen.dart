import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/navigation/app_routes.dart';
import '../../core/models/job.dart';
import '../../core/widgets/empty_state_widget.dart';
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
          ? const EmptyStateWidget(
        imagePath: 'assets/images/empty/263075.png',
        title: 'Избранное пока пусто',
        subtitle:
        'Добавьте интересующие вакансии, чтобы вернуться к ним позже.',
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