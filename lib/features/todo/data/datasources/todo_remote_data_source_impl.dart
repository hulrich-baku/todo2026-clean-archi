import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_2026/features/todo/data/datasources/todo_remote_data_source.dart';
import 'package:todo_2026/features/todo/data/model/todo_model.dart';

class TodoRemoteDataSourceImpl implements TodoRemoteDataSource {
  final SupabaseClient supabaseClient;

  TodoRemoteDataSourceImpl(this.supabaseClient);

  @override
  Future<void> createTodo(TodoModel todoModel) async {
    await supabaseClient
      .from('todos').insert(todoModel.toJson());
  }

  @override
  Future<void> deleteTodo(TodoModel todoModel) async {
    String id = todoModel.id!;
    await supabaseClient
      .from('todos')
      .delete()
      .eq('id', id);
  }

  @override
  Future<void> toggleCompleted(TodoModel todoModel) async {
    bool isCompleted = todoModel.isCompleted;
    String id = todoModel.id!;
    await supabaseClient
      .from('todos')
      .update({'is_completed' : !isCompleted}) // on bascule à la valeur contraire
      .eq('id', id);
  }

  @override
  Future<void> toggleFavorite(TodoModel todoModel) async {
    bool isFavorite = todoModel.isFavorite;
    String id = todoModel.id!;
    await supabaseClient
      .from('todos')
      .update({'is_favorite' : !isFavorite}) // on bascule à la valeur contraire
      .eq('id', id);
  }

  @override
  Future<void> updateTodo(TodoModel todoModel) async {
    String id = todoModel.id!;
    final Map<String, dynamic> data = todoModel.toJson();
    // On supprime l'id et la date de création pour éviter la redondance
    // la date de creation (created_at) est invariable
    data.remove('id');  data.remove('created_at');
    await supabaseClient
      .from('todos')
      .update(data)
      .eq('id', id); // l'id ne sert que de filtre ici (where id = id)
  }

  @override
  Stream<List<TodoModel>> watchTodos() {
    return supabaseClient.from('todos')
      .stream(primaryKey: ['id'])
      .order('created_at')
      .map((data) => data.map((json) => TodoModel.fromJson(json)).toList());
  }
}