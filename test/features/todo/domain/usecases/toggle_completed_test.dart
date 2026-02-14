import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_2026/features/todo/domain/entities/todo_entity.dart';
import 'package:todo_2026/features/todo/domain/repository/todo_repository.dart';
import 'package:todo_2026/features/todo/domain/usecases/toggle_completed.dart';

import '../../../../helpers/todo_helpers.dart';

class MockTodoRepository extends Mock implements TodoRepository {}

class FakeTodo extends Fake implements Todo {}

void main() {
  late MockTodoRepository mockTodoRepository;
  late ToggleCompleted toggleCompleted;

  setUpAll(() {
    registerFallbackValue(FakeTodo());
  });

  setUp(() {
    mockTodoRepository = MockTodoRepository();
    toggleCompleted = ToggleCompleted(mockTodoRepository);
  });

  test(
    'Doit appeler un repository qui reçoit un Todo et le bascule en completé. Il ne renvoit rien en retour', 
    () async {
      // ARRANGE
      when(() => mockTodoRepository.toggleCompleted(tTodo)).thenAnswer((_) => Future.value());
      // ACT
      await toggleCompleted(tTodo);
      // ASSERT
      verify(() => mockTodoRepository.toggleCompleted(tTodo)).called(1);
      verifyNoMoreInteractions(mockTodoRepository);
    }
  );
}