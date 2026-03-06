import 'job.dart';

class Application {
  final String id;
  final Job job;
  final DateTime appliedAt;

  const Application({
    required this.id,
    required this.job,
    required this.appliedAt,
  });
}