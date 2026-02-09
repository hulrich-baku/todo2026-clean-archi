import 'package:todo_2026/features/todo/data/datasources/todo_remote_data_source.dart';
import 'package:todo_2026/features/todo/data/model/todo_model.dart';
import 'package:todo_2026/features/todo/domain/entities/todo_entity.dart';
import 'package:todo_2026/features/todo/domain/repository/todo_repository.dart';

class RepositoryImpl implements TodoRepository {
  final TodoRemoteDataSource remoteDataSource;

  RepositoryImpl(this.remoteDataSource);

  @override
  Future<void> createTodo(Todo todo) {
    final TodoModel model = TodoModel.fromEntity(todo);
    return remoteDataSource.createTodo(model);
  }

  @override
  Future<void> deleteTodo(Todo todo) {
    final TodoModel model = TodoModel.fromEntity(todo);
    return remoteDataSource.deleteTodo(model);
  }

  @override
  Future<void> toggleCompleted(Todo todo) {
    final TodoModel model = TodoModel.fromEntity(todo);
    return remoteDataSource.toggleCompleted(model);
  }

  @override
  Future<void> toggleFavorite(Todo todo) {
    final TodoModel model = TodoModel.fromEntity(todo);
    return remoteDataSource.toggleFavorite(model);
  }

  @override
  Future<void> updateTodo(Todo todo) {
    final TodoModel model = TodoModel.fromEntity(todo);
    return remoteDataSource.updateTodo(model);
  }

  @override
  Stream<List<Todo>> watchTodos() {
    // Comme le TodoModel est un Todo, le polymorphisme s'opère
    return remoteDataSource.watchTodos();
  } 
}