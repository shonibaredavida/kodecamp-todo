class Todo {
  Todo(
      {required this.title,
      this.isCompleted = false,
      required this.dateCreated});
  final String title;
  final bool isCompleted;
  final DateTime dateCreated;
}
