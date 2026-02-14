import 'package:todo_2026/features/todo/domain/entities/todo_entity.dart';

class TodoModel extends Todo {
  TodoModel({
    super.id,
    required super.title,
    super.description,
    required super.isCompleted,
    required super.isFavorite,
    super.createdAt,
  });

  // DESERIALIZATION : Json (supabase) -> Model
  // On utilise 'factory' pour créer une nouvelle instance à partir de notre map
  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'],
      title:
          json['title'] as String? ??
          "Sans titre", // Valeur par défaut si title est null
      description:
          json['description'] as String? ??
          "", // Valeur par défaut si description est null
      isCompleted: json['is_completed'] as bool? ?? false,
      isFavorite: json['is_favorite'] as bool? ?? false,
      createdAt: json["created_at"] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
    );
  }

  // SERIALIZATION : Model -> Json (supabase)
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'title': title, // Valeur par défaut si title est null
      'description': description ?? "",
      'is_favorite': isFavorite,
      'is_completed': isCompleted,
      if (createdAt != null) 'created_at': createdAt?.toIso8601String(),
    };
  }

  // MAPPING : Entité -> Model
  // Utile dans le repository pour pouvoir appeler .toJson()
  factory TodoModel.fromEntity(Todo todo) {
    return TodoModel(
      id: todo.id,
      title: todo.title,
      description: todo.description,
      isCompleted: todo.isCompleted,
      isFavorite: todo.isFavorite,
      createdAt: todo.createdAt,
    );
  }
}
