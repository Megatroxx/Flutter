import 'package:flutter/material.dart';

class StepCity extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onChanged;

  const StepCity({
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
          'Введите город проживания',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: controller,
          onChanged: (_) => onChanged(),
          decoration: const InputDecoration(
            labelText: 'Город',
            hintText: 'Например: Москва',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 12),
        const Text('Это поможет подобрать вакансии ближе к вам.'),
      ],
    );
  }
}