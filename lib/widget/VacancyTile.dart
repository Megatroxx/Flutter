import 'package:flutter/material.dart';
import '../pages/models/vacancy.dart';

class VacancyTile extends StatelessWidget {
  final Vacancy vacancy;
  final VoidCallback onDelete;

  const VacancyTile({
    super.key,
    required this.vacancy,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
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
              vacancy.profession,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          Text(
            '${vacancy.salary} ₽',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          const SizedBox(width: 12),
          IconButton(
            onPressed: onDelete,
            icon: const Icon(Icons.delete),
            tooltip: 'Удалить',
          ),
        ],
      ),
    );
  }
}