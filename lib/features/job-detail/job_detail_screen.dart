import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/models/job.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  job.companyLogo,
                  width: 60,
                  height: 60,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    job.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            Text(
              job.company,
              style: const TextStyle(fontSize: 16),
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

            Text(
              job.description,
              style: const TextStyle(fontSize: 15),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  favoritesProvider.toggleFavorite(job);
                },
                icon: Icon(
                  isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border,
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