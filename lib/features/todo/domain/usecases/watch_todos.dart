import 'package:todo_2026/features/todo/domain/entities/todo_entity.dart';
import 'package:todo_2026/features/todo/domain/repository/todo_repository.dart';

class WatchTodos {
  final TodoRepository repository;

  WatchTodos(this.repository);

  Stream<List<Todo>> call() => repository.watchTodos();
}