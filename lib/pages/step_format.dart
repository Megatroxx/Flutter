import 'package:flutter/material.dart';
import '../main.dart'; // для enum WorkFormat

class StepFormat extends StatelessWidget {
  final WorkFormat? value;
  final ValueChanged<WorkFormat> onChanged;

  const StepFormat({
    super.key,
    required this.value,
    required this.onChanged,
  });

  String _label(WorkFormat f) {
    switch (f) {
      case WorkFormat.office:
        return 'Офис';
      case WorkFormat.hybrid:
        return 'Гибрид';
      case WorkFormat.remote:
        return 'Удалёнка';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Выберите формат работы',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        ...WorkFormat.values.map(
              (f) => RadioListTile<WorkFormat>(
            title: Text(_label(f)),
            value: f,
            groupValue: value,
            onChanged: (v) {
              if (v != null) onChanged(v);
            },
          ),
        ),
      ],
    );
  }
}