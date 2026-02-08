class Todo {
  final String? id;
  final String title;
  final String description;
  final bool isFavorite;
  final bool isCompleted;
  final DateTime cretedAt;

  Todo({
    required this.id,
    required this.title,
    required this.description,
    required this.isFavorite,
    required this.isCompleted,
    required this.cretedAt
  });
}