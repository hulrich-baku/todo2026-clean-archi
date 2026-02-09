import 'package:todo_2026/features/todo/domain/entities/todo_entity.dart';

class TodoModel extends Todo {
  TodoModel ({
    required super.id,
    required super.title,
    required super.description,
    required super.isCompleted,
    required super.isFavorite,
    required super.createdAt
  });

  // DESERIALIZATION : Json (supabase) -> Model
  // On utilise 'factory' pour créer une nouvelle instance à partir de notre map
  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'], 
      title: json['title'], 
      description: json['description'], 
      isCompleted: json['is_completed'] as bool, 
      isFavorite: json['is_favorite'] as bool, 
      createdAt: DateTime.parse(json['creted_at'] as String)
    );
  }

  // SERIALIZATION : Model -> Json (supabase)
  Map<String, dynamic> toJson () {
    return {
      'id' : id,
      'title' : title,
      'description' : description,
      'is_favorite' : isFavorite,
      'is_completed' : isCompleted,
      'created_at' : createdAt?.toIso8601String()
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
      createdAt: todo.createdAt
    );
  }
}