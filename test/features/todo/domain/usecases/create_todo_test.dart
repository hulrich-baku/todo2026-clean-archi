import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_2026/features/todo/domain/entities/todo_entity.dart';
import 'package:todo_2026/features/todo/domain/repository/todo_repository.dart';
import 'package:todo_2026/features/todo/domain/usecases/create_todo.dart';

class MockTodoRepository extends Mock implements TodoRepository {}

// on crée une fausse valeur pour que le Mocktail à quoi ressemble un Todo
class FakeTodo extends Fake implements Todo {}

void main() {
  late CreateTodo usecase;
  late MockTodoRepository mockTodoRepository;

  setUpAll(() {
    // Crucial pour les types personnalisés
    // notre fonction attend une todo non nulle
    registerFallbackValue(FakeTodo());
  });

  // s'exécute avant chaque test
  setUp((){
    mockTodoRepository = MockTodoRepository();
    usecase = CreateTodo(mockTodoRepository);
  });

  final Todo tTodo = Todo(
    id: 'id1',
    title: "Gagner de l'argent",
    description: "Faire son propre argent",
    isFavorite: true,
    isCompleted: false,
    cretedAt: DateTime(2026, 2, 22),
  );

  test(
    // la description
    'Doit appeler le repository pour créer une Todo et ne rien renvoyer',
    // le corps
    () async {
      // --- ARRANGE ---
      // On prépare le comportement du mock
      // "Quand on appelle createTodo avec n'importe quel Todo, retourne un Future vide (succès)"
      when(() => mockTodoRepository.createTodo(any())).thenAnswer((_) async => Future.value());

      // --- ACT ---
      // On lance le UseCase
      await usecase(tTodo);

      // --- ASSERT ---
      // On vérifie que la méthode du repository a été bien appelé
      verify(() => mockTodoRepository.createTodo(tTodo)).called(1);
      // On vérifie qu'une autre méthode n'a pas été appelée par erreur
      verifyNoMoreInteractions(mockTodoRepository);
    },
  );
}
