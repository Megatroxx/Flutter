class Job {
  final String id;
  final String title;
  final String company;
  final String salary;
  final String location;
  final String description;
  final String companyLogo;
  final String officeImage;

  const Job({
    required this.id,
    required this.title,
    required this.company,
    required this.salary,
    required this.location,
    this.description = '',
    this.companyLogo = '',
    this.officeImage = '',
  });

  Job copyWith({
    String? id,
    String? title,
    String? company,
    String? salary,
    String? location,
    String? description,
    String? companyLogo,
    String? officeImage,
  }) {
    return Job(
      id: id ?? this.id,
      title: title ?? this.title,
      company: company ?? this.company,
      salary: salary ?? this.salary,
      location: location ?? this.location,
      description: description ?? this.description,
      companyLogo: companyLogo ?? this.companyLogo,
      officeImage: officeImage ?? this.officeImage,
    );
  }
}