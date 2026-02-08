import 'package:todo_2026/features/todo/domain/entities/todo_entity.dart';

abstract class TodoRepository {
  Stream<List<Todo>> watchTodos();
  Future<void> createTodo(Todo todo);
  Future<void> updateTodo(Todo todo);
  Future<void> deleteTodo(Todo todo);
  Future<void> toggleFavorite(Todo todo);
  Future<void> toggleCompleted(Todo todo);
}