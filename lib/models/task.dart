class Task {
  String id;
  String title;
  String description;
  bool done;

  Task({
    this.id = '',
    required this.title,
    required this.description,
    this.done = false,
  });
}