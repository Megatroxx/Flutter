import 'package:flutter/material.dart';

class ApplicationsScreen extends StatefulWidget {
  const ApplicationsScreen({super.key});

  @override
  State<ApplicationsScreen> createState() => _ApplicationsScreenState();
}

class _ApplicationsScreenState extends State<ApplicationsScreen> {
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

  Widget _buildApplicationItem(Map<String, dynamic> item) {
    final String id = item["id"];
    final String profession = item["profession"];
    final String company = item["company"];
    final String status = item["status"];

    return Container(
      key: ValueKey(id),
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
            child: const Icon(
              Icons.delete,
              color: Colors.red,
              size: 28,
            ),
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