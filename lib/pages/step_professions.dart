import 'package:flutter/material.dart';

class StepProfession extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onChanged;

  const StepProfession({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Введите название профессии',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: controller,
          onChanged: (_) => onChanged(),
          decoration: const InputDecoration(
            labelText: 'Профессия',
            hintText: 'Например: Flutter-разработчик',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'Пример: “аналитик”, “тестировщик”, “дизайнер”.',
        ),
      ],
    );
  }
}