import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_2026/features/todo/domain/entities/todo_entity.dart';
import 'package:todo_2026/features/todo/domain/repository/todo_repository.dart';
import 'package:todo_2026/features/todo/domain/usecases/delete_todo.dart';


class MockTodoRepository extends Mock implements TodoRepository {}

class FakeTodo extends Fake implements Todo {}

void main() {
  late DeleteTodo deleteTodo;
  late MockTodoRepository mockTodoRepository;

  setUpAll(() {
    registerFallbackValue(FakeTodo());
  });

  setUp(() {
    mockTodoRepository = MockTodoRepository();
    deleteTodo = DeleteTodo(mockTodoRepository);
  });

  final Todo tTodo = Todo(
    id: 'id1',
    title: "Gagner de l'argent",
    description: "Faire son propre argent",
    isFavorite: true,
    isCompleted: false,
    createdAt: DateTime(2026, 2, 22),
  );

  test(
    'Doit appeler le repository pour supprimer un Todo et ne rien renvoyer',
    () async {
      // ARRANGE
      when(() => mockTodoRepository.deleteTodo(any())).thenAnswer((_) => Future.value());
      // ACT
      await deleteTodo(tTodo);
      // ASSERT
      verify(() => mockTodoRepository.deleteTodo(tTodo)).called(1);
      verifyNoMoreInteractions(mockTodoRepository);
    }
  ); 
}
