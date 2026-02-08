import 'package:todo_2026/features/todo/domain/entities/todo_entity.dart';
import 'package:todo_2026/features/todo/domain/repository/todo_repository.dart';

class CreateTodo {
  final TodoRepository repository;

  CreateTodo(this.repository);

  Future<void> call (Todo todo) => repository.createTodo(todo);
}