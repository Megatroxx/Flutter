import 'package:flutter/material.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final List<Map<String, dynamic>> _favoriteVacancies = [
    {"profession": "Flutter разработчик", "count": 1},
    {"profession": "Backend разработчик", "count": 2},
    {"profession": "UI/UX дизайнер", "count": 1},
    {"profession": "QA тестировщик", "count": 3},
    {"profession": "Data аналитик", "count": 1},
    {"profession": "Frontend разработчик", "count": 2},
    {"profession": "DevOps инженер", "count": 1},
    {"profession": "Project менеджер", "count": 1},
    {"profession": "Mobile разработчик", "count": 2},
    {"profession": "Системный аналитик", "count": 1},
    {"profession": "Product менеджер", "count": 1},
    {"profession": "Data scientist", "count": 2},
  ];

  Widget _buildFavoriteItem(Map<String, dynamic> item) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              item["profession"],
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Text(
            'x${item["count"]}',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: _favoriteVacancies.length,
      itemBuilder: (context, index) {
        final item =
        _favoriteVacancies[_favoriteVacancies.length - 1 - index];
        return _buildFavoriteItem(item);
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
    );
  }
}