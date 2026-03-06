import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/navigation/app_routes.dart';
import '../../core/models/job.dart';
import '../jobs/widgets/job_card.dart';
import 'applications_provider.dart';

class ApplicationsScreen extends StatelessWidget {
  const ApplicationsScreen({super.key});

  void _openDetails(BuildContext context, Job job) {
    Navigator.pushNamed(
      context,
      AppRoutes.jobDetail,
      arguments: job,
    );
  }

  @override
  Widget build(BuildContext context) {
    final applications = context.watch<ApplicationsProvider>().applications;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Мои отклики'),
      ),
      body: applications.isEmpty
          ? const Center(
        child: Text(
          'Вы ещё не отправили ни одного отклика',
          style: TextStyle(fontSize: 16),
        ),
      )
          : ListView.builder(
        itemCount: applications.length,
        itemBuilder: (context, index) {
          final application = applications[index];
          final job = application.job;

          return Column(
            children: [
              JobCard(
                job: job,
                onTap: () => _openDetails(context, job),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Отправлено: ${application.appliedAt.day.toString().padLeft(2, '0')}.${application.appliedAt.month.toString().padLeft(2, '0')}.${application.appliedAt.year}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
            ],
          );
        },
      ),
    );
  }
}