import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_2026/features/todo/presentatation/providers/todo_providers.dart';
import 'package:todo_2026/features/todo/presentatation/widgets/todo_item_tile_widget.dart';

class TodoStreamListWidget extends ConsumerWidget {
  const TodoStreamListWidget({super.key});

  // Le plateau de jeu (le scroll principal)
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todosAsync = ref.watch(watchTodosProvider);

    return CustomScrollView(
      slivers: [
        // L'en-tête qui reste stable même si les données chargent
        const SliverAppBar(
          title: Text("Mes Tâches"),
          // floating: true, // La barre revient dès qu'on scrolle vers le haut
          pinned: false, // Garde la barre visible (utile avec des Tabs)
        ),

        // On traite les états de Riverpod DIRECTEMENT comme un élément du scroll
        todosAsync.when(
          data: (todos) => SliverList(
            // SliverList est la version "Sliver" de ListView.builder
            delegate: SliverChildBuilderDelegate(
              (context, index) => TodoItemTileWidget(todo: todos[index]),
              childCount: todos.length,
            ),
          ),
          // SliverFillRemaining permet de centrer le loader dans tout l'espace vide
          loading: () => const SliverFillRemaining(
            child: Center(child: CircularProgressIndicator()),
          ),
          // SliverToBoxAdapter permet d'insérer un widget normal dans un CustomScrollView
          error: (err, stack) => SliverToBoxAdapter(
            child: Text(err.toString())
            // Column(children: List.generate(
            //     15,
            //     (a) => TodoItemTileWidget(
            //       todo: Todo(
            //         title: 'Titre de la tâche n°${a + 1}',
            //         description:
            //             'Description $a estPaire = ${a.isEven} et estImpair = ${a.isOdd}',
            //         isFavorite: a.isEven,
            //         isCompleted: a.isOdd,
            //       ),
            //     ),
            //   ),
            // ),
          ),
        ),
      ],
    );
  }
}
