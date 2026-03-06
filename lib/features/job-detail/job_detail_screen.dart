import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/models/job.dart';
import '../../core/navigation/app_routes.dart';
import '../../core/widgets/company_logo.dart';
import '../applications/applications_provider.dart';
import '../favorites/favorites_provider.dart';

class JobDetailScreen extends StatelessWidget {
  final Job job;

  const JobDetailScreen({
    super.key,
    required this.job,
  });

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = context.watch<FavoritesProvider>();
    final applicationsProvider = context.watch<ApplicationsProvider>();

    final isFavorite = favoritesProvider.isFavorite(job);
    final hasApplied = applicationsProvider.hasApplied(job);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Детали вакансии'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CompanyLogo(
                  path: job.companyLogo,
                  size: 70,
                  borderRadius: 12,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    job.title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              job.company,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              job.salary,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              job.location,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Описание вакансии',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              job.description.isEmpty
                  ? 'Описание вакансии отсутствует.'
                  : job.description,
              style: const TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: hasApplied
                    ? null
                    : () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.applyForm,
                    arguments: job,
                  );
                },
                icon: const Icon(Icons.send),
                label: Text(
                  hasApplied ? 'Отклик уже отправлен' : 'Откликнуться',
                ),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  favoritesProvider.toggleFavorite(job);
                },
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                ),
                label: Text(
                  isFavorite
                      ? 'Убрать из избранного'
                      : 'Добавить в избранное',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}