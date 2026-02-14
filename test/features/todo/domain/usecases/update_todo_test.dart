import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_2026/features/todo/domain/entities/todo_entity.dart';
import 'package:todo_2026/features/todo/domain/repository/todo_repository.dart';
import 'package:todo_2026/features/todo/domain/usecases/update_todo.dart';

import '../../../../helpers/todo_helpers.dart';

class MockTodoReposirtory extends Mock implements TodoRepository {}

class FakeTodo extends Fake implements Todo {}

void main() {
  late UpdateTodo updateTodo;
  late MockTodoReposirtory mockTodoReposirtory;

  setUpAll(() {
    registerFallbackValue(FakeTodo());
  });

  setUp(() {
      mockTodoReposirtory = MockTodoReposirtory();
      updateTodo = UpdateTodo(mockTodoReposirtory);
    }
  );

  test(
    "Doit appeler une repossitory pour mettre à jour un Todo et ne rien renvoyer", 
    () async {
      // ARRANGE
      when(() => mockTodoReposirtory.updateTodo(any())).thenAnswer((_) async => Future.value());
      // ACT
      await updateTodo(tTodo);
      // ASSERT
      verify(() => mockTodoReposirtory.updateTodo(tTodo)).called(1);
      verifyNoMoreInteractions(mockTodoReposirtory);
    }
  );
}