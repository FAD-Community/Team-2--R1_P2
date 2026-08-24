enum JobStatus {
  accepted,
  scheduled,
  onTheWay,
  arrived,
  inProgress,
  completed,
  customerConfirmation,
}

class JobStatusModel {
  final JobStatus status;
  final String title;
  final String? subtitle;

  const JobStatusModel({
    required this.status,
    required this.title,
    this.subtitle,
  });
}

class JobStatuses {
  static const List<JobStatusModel> all = [
    JobStatusModel(
      status: JobStatus.accepted,
      title: 'Job Accepted',
      subtitle: 'Sep 20, 2026 - 10:00 AM',
    ),
    JobStatusModel(
      status: JobStatus.scheduled,
      title: 'Scheduled',
      subtitle: 'Sep 20, 2026 - 10:00 AM',
    ),
    JobStatusModel(
      status: JobStatus.onTheWay,
      title: 'On The Way',
      subtitle: 'Sep 20, 2026 - 10:00 AM',
    ),
    JobStatusModel(
      status: JobStatus.arrived,
      title: 'Arrived',
      subtitle: 'Sep 20, 2026 - 10:00 AM',
    ),
    JobStatusModel(
      status: JobStatus.inProgress,
      title: 'In Progress',
      subtitle: 'Not Started Yet',
    ),
    JobStatusModel(
      status: JobStatus.completed,
      title: 'Completed',
      subtitle: 'Waiting for completion',
    ),
    JobStatusModel(
      status: JobStatus.customerConfirmation,
      title: 'Customer Confirmation',
      subtitle: 'Waiting for customer confirmation',
    ),
  ];
}
