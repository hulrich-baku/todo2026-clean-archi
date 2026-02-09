import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_2026/features/todo/presentatation/widgets/create_todo_bottom_sheet.dart';

class MyShellScaffold extends StatelessWidget {
  final Widget child;
  final GoRouterState state;

  const MyShellScaffold({super.key, required this.state, required this.child});

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 1;
    if (state.matchedLocation == '/favoris') selectedIndex = 0;
    if (state.matchedLocation == '/newList') selectedIndex = 2;

    return DefaultTabController(
      length: 3,
      initialIndex: selectedIndex,
      key: ValueKey(
        selectedIndex,
      ), // La clé force le rafraichissement du controller quand l'index change via l'URL
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            showModalBottomSheet(
              context: context,
              isScrollControlled: true, 
              builder: (context) => CreateTodoBottomSheet()
            );
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          bottom: TabBar(
            isScrollable: true,
            tabAlignment: .start,
            onTap: (index) {
              if (index == 0) context.go('/favoris');
              if (index == 1) context.go('/tasks');
              if (index == 2) context.go('/newList');
            },
            tabs: [
              Tab(child: Icon(Icons.star)),
              Tab(child: Text("Mes tâches")),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add),
                    SizedBox(width: 2),
                    Text("Nouvelle liste", overflow: TextOverflow.ellipsis),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: child, // obligatoire pour afficher le contenu TabBar
      ),
    );
  }
}
