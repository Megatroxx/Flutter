import 'package:flutter/material.dart';

class StepFullTime extends StatelessWidget {
  final bool? value;
  final ValueChanged<bool> onChanged;

  const StepFullTime({
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
          'Планируете работать полный день?',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        RadioListTile<bool>(
          title: const Text('Да, полный день'),
          value: true,
          groupValue: selected,
          onChanged: (v) => onChanged(v ?? true),
        ),
        RadioListTile<bool>(
          title: const Text('Нет, частичная занятость'),
          value: false,
          groupValue: selected,
          onChanged: (v) => onChanged(v ?? false),
        ),
      ],
    );
  }
}