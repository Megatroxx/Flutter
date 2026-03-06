import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/models/job.dart';
import '../../core/widgets/company_logo.dart';
import '../favorites/favorites_provider.dart';

class JobDetailScreen extends StatelessWidget {
  const JobDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final job = ModalRoute.of(context)!.settings.arguments as Job;

    final favoritesProvider = context.watch<FavoritesProvider>();
    final isFavorite = favoritesProvider.isFavorite(job);

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
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Отклик на вакансию'),
                      content: const Text(
                        'Функция отклика будет реализована на следующем этапе разработки.',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Закрыть'),
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.send),
                label: const Text('Откликнуться'),
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