import 'package:todo_2026/features/todo/data/model/todo_model.dart';

abstract class TodoRemoteDataSource {
  Stream<List<TodoModel>> watchTodos();
  Future<void> createTodo(TodoModel model);
  Future<void> updateTodo(TodoModel model);
  Future<void> deleteTodo(TodoModel model);
  Future<void> toggleFavorite(TodoModel model);
  Future<void> toggleCompleted(TodoModel model);
}