import 'package:flutter/material.dart';

class ApplicationsScreen extends StatefulWidget {
  const ApplicationsScreen({super.key});

  @override
  State<ApplicationsScreen> createState() => _ApplicationsScreenState();
}

class _ApplicationsScreenState extends State<ApplicationsScreen> {
  final List<Map<String, dynamic>> _applications = [
    {"profession": "Flutter разработчик", "company": "Яндекс", "status": "Отправлено"},
    {"profession": "Backend разработчик", "company": "VK", "status": "На рассмотрении"},
    {"profession": "UI/UX дизайнер", "company": "Тинькофф", "status": "Приглашение"},
    {"profession": "QA тестировщик", "company": "Сбер", "status": "Отказ"},
    {"profession": "Data аналитик", "company": "Ozon", "status": "На рассмотрении"},
    {"profession": "DevOps инженер", "company": "Avito", "status": "Отправлено"},
    {"profession": "Project менеджер", "company": "Wildberries", "status": "На рассмотрении"},
    {"profession": "Frontend разработчик", "company": "Касперский", "status": "Приглашение"},
    {"profession": "Mobile разработчик", "company": "MTS", "status": "Отправлено"},
    {"profession": "Системный аналитик", "company": "Альфа-Банк", "status": "Отказ"},
    {"profession": "Product менеджер", "company": "Lamoda", "status": "На рассмотрении"},
    {"profession": "Data scientist", "company": "X5 Group", "status": "Отправлено"},
  ];

  Widget _buildApplicationItem(Map<String, dynamic> item) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item["profession"],
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 6),
          Text(
            'Компания: ${item["company"]}',
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 6),
          Text(
            'Статус: ${item["status"]}',
            style: const TextStyle(fontSize: 16),
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