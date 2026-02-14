import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_2026/features/todo/domain/entities/todo_entity.dart';
import 'package:todo_2026/features/todo/domain/repository/todo_repository.dart';
import 'package:todo_2026/features/todo/domain/usecases/toggle_favorite.dart';

import '../../../../helpers/todo_helpers.dart';

class MockTodoRepository extends Mock implements TodoRepository {}

class FakeTodo extends Fake implements Todo {}

void main () {
  late MockTodoRepository mockTodoRepository;
  late ToggleFavorite toggleFavorite;

  setUpAll(() {
    registerFallbackValue(FakeTodo());
  });

  setUp(() {
    mockTodoRepository = MockTodoRepository();
    toggleFavorite = ToggleFavorite(mockTodoRepository);
  });

  test(
    'Doit appeler un repository qui reçoit un Todo et le bascule en favori. Il ne renvoie rien en retour',
    () async {
      // ARRANGE
      when(() => mockTodoRepository.toggleFavorite(tTodo)).thenAnswer((_) async => Future.value());
      // ACT
      await toggleFavorite(tTodo);
      // ASSERT
      verify(() => mockTodoRepository.toggleFavorite(tTodo)).called(1);
      verifyNoMoreInteractions(mockTodoRepository);
    }

  );
}