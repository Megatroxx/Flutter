import 'package:flutter/material.dart';

import '../../../core/models/job.dart';
import '../../../core/widgets/company_logo.dart';
import '../../../core/widgets/job_meta_row.dart';

class JobCard extends StatelessWidget {
  final Job job;
  final VoidCallback onTap;

  const JobCard({
    super.key,
    required this.job,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CompanyLogo(
                path: job.companyLogo,
                size: 52,
                borderRadius: 10,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      job.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      job.company,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 6),
                    JobMetaRow(
                      icon: Icons.payments_outlined,
                      text: job.salary,
                    ),
                    const SizedBox(height: 4),
                    JobMetaRow(
                      icon: Icons.place_outlined,
                      text: job.location,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}