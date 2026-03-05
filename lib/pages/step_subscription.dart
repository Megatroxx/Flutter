import 'package:flutter/material.dart';

class StepSubscription extends StatelessWidget {
  final bool? value;
  final ValueChanged<bool> onChanged;

  const StepSubscription({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final selected = value;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Хотите приобрести подписку?',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        RadioListTile<bool>(
          title: const Text('Да'),
          value: true,
          groupValue: selected,
          onChanged: (v) => onChanged(v ?? true),
        ),
        RadioListTile<bool>(
          title: const Text('Нет'),
          value: false,
          groupValue: selected,
          onChanged: (v) => onChanged(v ?? false),
        ),
        const SizedBox(height: 12),
        const Text('Подписка может давать доступ к премиум вакансиям.'),
      ],
    );
  }
}