import 'package:flutter/material.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => FavoritesScreenState();
}

class FavoritesScreenState extends State<FavoritesScreen> {
  final List<Map<String, dynamic>> _favoriteVacancies = [
    {"id": "f1", "profession": "Flutter разработчик", "count": 1},
    {"id": "f2", "profession": "Backend разработчик", "count": 2},
    {"id": "f3", "profession": "UI/UX дизайнер", "count": 1},
    {"id": "f4", "profession": "QA тестировщик", "count": 3},
    {"id": "f5", "profession": "Data аналитик", "count": 1},
    {"id": "f6", "profession": "Frontend разработчик", "count": 2},
    {"id": "f7", "profession": "DevOps инженер", "count": 1},
    {"id": "f8", "profession": "Project менеджер", "count": 1},
    {"id": "f9", "profession": "Mobile разработчик", "count": 2},
    {"id": "f10", "profession": "Системный аналитик", "count": 1},
    {"id": "f11", "profession": "Product менеджер", "count": 1},
    {"id": "f12", "profession": "Data scientist", "count": 2},
  ];

  void _deleteById(String id) {
    setState(() {
      _favoriteVacancies.removeWhere((item) => item["id"] == id);
    });
  }

  // ✅ Метод вызывается из main.dart через GlobalKey
  void showAddDialog() {
    final professionController = TextEditingController();
    final countController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Добавить в избранное'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: professionController,
                decoration: const InputDecoration(
                  labelText: 'Профессия',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: countController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Количество (xN)',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                professionController.dispose();
                countController.dispose();
                Navigator.pop(context);
              },
              child: const Text('Отмена'),
            ),
            ElevatedButton(
              onPressed: () {
                final profession = professionController.text.trim();
                final count = int.tryParse(countController.text.trim());

                if (profession.isEmpty || count == null) return;

                setState(() {
                  final id = DateTime.now().microsecondsSinceEpoch.toString();
                  _favoriteVacancies.add({
                    "id": id,
                    "profession": profession,
                    "count": count,
                  });
                });

                professionController.dispose();
                countController.dispose();
                Navigator.pop(context);
              },
              child: const Text('Добавить'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildFavoriteItem(Map<String, dynamic> item) {
    final String id = item["id"];
    final String profession = item["profession"];
    final int count = item["count"];

    return Container(
      key: ValueKey(id), // ✅ корректное сопоставление
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
              profession,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          Text(
            'x$count',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () => _deleteById(id),
            child: const Icon(Icons.delete, color: Colors.red, size: 28),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _favoriteVacancies.length,
      itemBuilder: (context, index) {
        final item =
        _favoriteVacancies[_favoriteVacancies.length - 1 - index];
        return _buildFavoriteItem(item);
      },
    );
  }
}