import 'package:flutter/material.dart';
import 'package:flutter_practice/pages/wizard.dart';
import '../main.dart'; // WorkFormat

class StepSummary extends StatelessWidget {
  final String profession;
  final String city;
  final bool? fullTime;
  final WorkFormat? format;
  final bool? subscription;
  final VoidCallback onRestart;

  const StepSummary({
    super.key,
    required this.profession,
    required this.city,
    required this.fullTime,
    required this.format,
    required this.subscription,
    required this.onRestart,
  });

  String _formatLabel(WorkFormat? f) {
    if (f == null) return '—';
    switch (f) {
      case WorkFormat.office:
        return 'Офис';
      case WorkFormat.hybrid:
        return 'Гибрид';
      case WorkFormat.remote:
        return 'Удалёнка';
    }
  }

  String _yesNo(bool? v) {
    if (v == null) return '—';
    return v ? 'Да' : 'Нет';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Итог',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Профессия: ${profession.isEmpty ? '—' : profession}'),
              const SizedBox(height: 8),
              Text('Город: ${city.isEmpty ? '—' : city}'),
              const SizedBox(height: 8),
              Text('Полный день: ${_yesNo(fullTime)}'),
              const SizedBox(height: 8),
              Text('Формат: ${_formatLabel(format)}'),
              const SizedBox(height: 8),
              Text('Подписка: ${_yesNo(subscription)}'),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Text('Кнопка снизу “Сначала” сбросит ответы и начнёт заново.'),
      ],
    );
  }
}