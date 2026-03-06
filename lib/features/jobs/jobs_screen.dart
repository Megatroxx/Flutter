import 'package:flutter/material.dart';
import '../../core/data/mock_jobs.dart';
import '../../core/models/job.dart';
import '../../core/navigation/app_routes.dart';
import 'widgets/job_card.dart';

class JobsScreen extends StatelessWidget {
  const JobsScreen({super.key});

  void _openDetails(BuildContext context, Job job) {
    Navigator.pushNamed(
      context,
      AppRoutes.jobDetail,
      arguments: job,
    );
  }

  @override
  Widget build(BuildContext context) {
    final jobs = allJobs;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Вакансии'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.favorites);
            },
            icon: const Icon(Icons.favorite_border),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: jobs.length,
        itemBuilder: (context, index) {
          final job = jobs[index];
          return JobCard(
            job: job,
            onTap: () => _openDetails(context, job),
          );
        },
      ),
    );
  }
}