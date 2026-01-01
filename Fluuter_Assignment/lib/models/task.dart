class Task {
  String title;
  String description;
  String priority;
  bool isCompleted;

  Task({
    required this.title,
    required this.description,
    required this.priority,
    this.isCompleted = false,
  });
}
