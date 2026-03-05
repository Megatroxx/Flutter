import 'package:flutter/material.dart';

class ApplicationsScreen extends StatefulWidget {
  const ApplicationsScreen({super.key});

  @override
  State<ApplicationsScreen> createState() => ApplicationsScreenState();
}

class ApplicationsScreenState extends State<ApplicationsScreen> {
  final List<Map<String, dynamic>> _applications = [
    {"id": "a1", "profession": "Flutter разработчик", "company": "Яндекс", "status": "Отправлено"},
    {"id": "a2", "profession": "Backend разработчик", "company": "VK", "status": "На рассмотрении"},
    {"id": "a3", "profession": "UI/UX дизайнер", "company": "Тинькофф", "status": "Приглашение"},
    {"id": "a4", "profession": "QA тестировщик", "company": "Сбер", "status": "Отказ"},
    {"id": "a5", "profession": "Data аналитик", "company": "Ozon", "status": "На рассмотрении"},
    {"id": "a6", "profession": "DevOps инженер", "company": "Avito", "status": "Отправлено"},
    {"id": "a7", "profession": "Project менеджер", "company": "Wildberries", "status": "На рассмотрении"},
    {"id": "a8", "profession": "Frontend разработчик", "company": "Касперский", "status": "Приглашение"},
    {"id": "a9", "profession": "Mobile разработчик", "company": "MTS", "status": "Отправлено"},
    {"id": "a10", "profession": "Системный аналитик", "company": "Альфа-Банк", "status": "Отказ"},
    {"id": "a11", "profession": "Product менеджер", "company": "Lamoda", "status": "На рассмотрении"},
    {"id": "a12", "profession": "Data scientist", "company": "X5 Group", "status": "Отправлено"},
  ];

  void _deleteById(String id) {
    setState(() {
      _applications.removeWhere((item) => item["id"] == id);
    });
  }

  void showAddDialog() {
    final professionController = TextEditingController();
    final companyController = TextEditingController();
    final statusController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Добавить отклик'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: professionController,
                decoration: const InputDecoration(
                  labelText: 'Вакансия',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: companyController,
                decoration: const InputDecoration(
                  labelText: 'Компания',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: statusController,
                decoration: const InputDecoration(
                  labelText: 'Статус',
                  hintText: 'Напр.: Отправлено',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                professionController.dispose();
                companyController.dispose();
                statusController.dispose();
                Navigator.pop(context);
              },
              child: const Text('Отмена'),
            ),
            ElevatedButton(
              onPressed: () {
                final profession = professionController.text.trim();
                final company = companyController.text.trim();
                final status = statusController.text.trim();

                if (profession.isEmpty || company.isEmpty || status.isEmpty) return;

                setState(() {
                  final id = DateTime.now().microsecondsSinceEpoch.toString();
                  _applications.add({
                    "id": id,
                    "profession": profession,
                    "company": company,
                    "status": status,
                  });
                });

                professionController.dispose();
                companyController.dispose();
                statusController.dispose();
                Navigator.pop(context);
              },
              child: const Text('Добавить'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildApplicationItem(Map<String, dynamic> item) {
    final String id = item["id"];
    final String profession = item["profession"];
    final String company = item["company"];
    final String status = item["status"];

    return Container(
      key: ValueKey(id), // ✅ корректное сопоставление
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  profession,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 6),
                Text('Компания: $company', style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 6),
                Text('Статус: $status', style: const TextStyle(fontSize: 16)),
              ],
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
    return ListView.separated(
      itemCount: _applications.length,
      itemBuilder: (context, index) {
        final item = _applications[index];
        return _buildApplicationItem(item);
      },
      separatorBuilder: (context, index) => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Divider(height: 1),
      ),
    );
  }
}