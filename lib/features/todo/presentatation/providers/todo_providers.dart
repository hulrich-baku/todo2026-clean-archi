import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_2026/core/providers/supabase_provider.dart';
import 'package:todo_2026/features/todo/data/datasources/todo_remote_data_source_impl.dart';
import 'package:todo_2026/features/todo/data/repository_impl/repository_impl.dart';
import 'package:todo_2026/features/todo/domain/usecases/create_todo.dart';
import 'package:todo_2026/features/todo/domain/usecases/delete_todo.dart';
import 'package:todo_2026/features/todo/domain/usecases/toggle_completed.dart';
import 'package:todo_2026/features/todo/domain/usecases/toggle_favorite.dart';
import 'package:todo_2026/features/todo/domain/usecases/update_todo.dart';
import 'package:todo_2026/features/todo/domain/usecases/watch_todos.dart';

// DATA
final remoteDataSourceProvider = Provider<TodoRemoteDataSourceImpl>(
  (ref) {
    final supabase = ref.watch(supabaseProvider);
    return TodoRemoteDataSourceImpl(supabase);
  }
);

// REPO
final repositoryProvider = Provider<RepositoryImpl>(
  (ref) {
    final remoteDataSource = ref.watch(remoteDataSourceProvider);
    return RepositoryImpl(remoteDataSource);
  }
);

// --- USES CASES ---
final createTodoProvider = Provider<CreateTodo>(
  (ref) {
    final repository = ref.watch(repositoryProvider);
    return CreateTodo(repository);
  }
);

final deleteTodoProvider = Provider<DeleteTodo>(
  (ref) {
    final repository = ref.watch(repositoryProvider);
    return DeleteTodo(repository);
  }
);

final updateTodoProvider = Provider<UpdateTodo>(
  (ref) {
    final repository = ref.watch(repositoryProvider);
    return UpdateTodo(repository);
  }
);

final watchTodosProvider = Provider<WatchTodos>(
  (ref) {
    final repository = ref.watch(repositoryProvider);
    return WatchTodos(repository);
  }
);

final toggleFavoriteProvider = Provider<ToggleFavorite>(
  (ref) {
    final repository = ref.watch(repositoryProvider);
    return ToggleFavorite(repository);
  }
);

final toggleCompletedProvider = Provider<ToggleCompleted>(
  (ref) {
    final repository = ref.watch(repositoryProvider);
    return ToggleCompleted(repository);
  }
);