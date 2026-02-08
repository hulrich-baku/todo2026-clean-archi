import 'package:todo_2026/features/todo/domain/entities/todo_entity.dart';
import 'package:todo_2026/features/todo/domain/repository/todo_repository.dart';

class ToggleCompleted {
  final TodoRepository repository;

  ToggleCompleted(this.repository);

  Future<void> call(Todo todo) => repository.toggleCompleted(todo);
}