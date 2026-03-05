import 'package:flutter/material.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => CatalogScreenState();
}

class CatalogScreenState extends State<CatalogScreen> {
  final List<Map<String, dynamic>> _vacancies = [
    {"id": "v1", "profession": "Flutter разработчик", "salary": 180000},
    {"id": "v2", "profession": "Backend разработчик", "salary": 200000},
    {"id": "v3", "profession": "UI/UX дизайнер", "salary": 150000},
    {"id": "v4", "profession": "QA тестировщик", "salary": 140000},
    {"id": "v5", "profession": "Data аналитик", "salary": 190000},
    {"id": "v6", "profession": "Frontend разработчик", "salary": 170000},
    {"id": "v7", "profession": "DevOps инженер", "salary": 210000},
    {"id": "v8", "profession": "Project менеджер", "salary": 160000},
    {"id": "v9", "profession": "Mobile разработчик", "salary": 175000},
    {"id": "v10", "profession": "Системный аналитик", "salary": 185000},
  ];

  void _deleteById(String id) {
    setState(() {
      _vacancies.removeWhere((item) => item["id"] == id);
    });
  }

  void showAddDialog() {
    final professionController = TextEditingController();
    final salaryController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Добавить вакансию'),
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
                controller: salaryController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Зарплата (₽)',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                professionController.dispose();
                salaryController.dispose();
                Navigator.pop(context);
              },
              child: const Text('Отмена'),
            ),
            ElevatedButton(
              onPressed: () {
                final profession = professionController.text.trim();
                final salary = int.tryParse(salaryController.text.trim());

                if (profession.isEmpty || salary == null) return;

                setState(() {
                  final id = DateTime.now().microsecondsSinceEpoch.toString();
                  _vacancies.add({
                    "id": id,
                    "profession": profession,
                    "salary": salary,
                  });
                });

                professionController.dispose();
                salaryController.dispose();
                Navigator.pop(context);
              },
              child: const Text('Добавить'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildVacancyItem(Map<String, dynamic> item) {
    final String id = item["id"];
    final String profession = item["profession"];
    final int salary = item["salary"];

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
            '$salary ₽',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
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
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: _vacancies.map((item) => _buildVacancyItem(item)).toList(),
      ),
    );
  }
}