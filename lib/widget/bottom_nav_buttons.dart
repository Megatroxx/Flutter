import 'package:flutter/material.dart';

class BottomNavButtons extends StatelessWidget {
  final bool canGoBack;
  final bool canGoNext;
  final bool isLast;
  final VoidCallback onBack;
  final VoidCallback onNext;
  final VoidCallback onFinish;

  const BottomNavButtons({
    super.key,
    required this.canGoBack,
    required this.canGoNext,
    required this.isLast,
    required this.onBack,
    required this.onNext,
    required this.onFinish,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: canGoBack ? onBack : null,
                child: const Text('Назад'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: FilledButton(
                onPressed: isLast ? onFinish : (canGoNext ? onNext : null),
                child: Text(isLast ? 'Сначала' : 'Вперёд'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}