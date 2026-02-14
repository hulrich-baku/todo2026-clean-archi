class Todo {
  final String? id;
  final String title;
  final String? description;
  final bool isFavorite;
  final bool isCompleted;
  final DateTime? createdAt;

  Todo({
    this.id,
    required this.title,
    this.description,
    required this.isFavorite,
    required this.isCompleted,
    this.createdAt
  });
}