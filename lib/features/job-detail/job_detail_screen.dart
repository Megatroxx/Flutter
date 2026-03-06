import 'package:flutter/material.dart';
import '../../core/models/job.dart';

class JobDetailScreen extends StatelessWidget {
  const JobDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final job = ModalRoute.of(context)!.settings.arguments as Job;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Детали вакансии'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _LogoLarge(path: job.companyLogo),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        job.title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        job.company,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            _InfoRow(icon: Icons.payments_outlined, text: job.salary),
            const SizedBox(height: 8),
            _InfoRow(icon: Icons.place_outlined, text: job.location),

            const SizedBox(height: 20),
            const Text(
              'Описание',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            Text(
              job.description.isEmpty ? 'Описание не указано.' : job.description,
              style: const TextStyle(fontSize: 14, height: 1.35),
            ),

            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // пока заглушка — добавим форму отклика позже
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text('Отклик'),
                      content: const Text('Здесь будет форма отправки отклика.'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                },
                child: const Text('Откликнуться'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18),
        const SizedBox(width: 8),
        Expanded(child: Text(text, style: const TextStyle(fontSize: 14))),
      ],
    );
  }
}

class _LogoLarge extends StatelessWidget {
  final String path;

  const _LogoLarge({required this.path});

  @override
  Widget build(BuildContext context) {
    final hasPath = path.trim().isNotEmpty;

    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: Container(
        width: 72,
        height: 72,
        color: Colors.black12,
        child: hasPath
            ? Image.asset(
          path,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => const Icon(Icons.business, size: 32),
        )
            : const Icon(Icons.business, size: 32),
      ),
    );
  }
}