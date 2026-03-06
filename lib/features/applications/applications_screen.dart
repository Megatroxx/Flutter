import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/models/job.dart';
import '../../core/navigation/app_routes.dart';
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

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  JobCard(
                    job: job,
                    onTap: () => _openDetails(context, job),
                  ),
                  if (job.officeImage.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          job.officeImage,
                          width: double.infinity,
                          height: 180,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Container(
                            width: double.infinity,
                            height: 180,
                            color: Colors.black12,
                            alignment: Alignment.center,
                            child: const Icon(
                              Icons.image_not_supported_outlined,
                              size: 36,
                            ),
                          ),
                        ),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: Text(
                      'Отправлено: ${application.appliedAt.day.toString().padLeft(2, '0')}.${application.appliedAt.month.toString().padLeft(2, '0')}.${application.appliedAt.year}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}