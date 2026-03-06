import 'job.dart';

class Application {
  final String id;
  final Job job;
  final DateTime appliedAt;
  final String fullName;
  final String phone;
  final String message;

  const Application({
    required this.id,
    required this.job,
    required this.appliedAt,
    required this.fullName,
    required this.phone,
    this.message = '',
  });
}