import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_2026/app/presentation/my_shell_scaffold.dart';


final app_router = GoRouter(
  initialLocation: '/tasks',
  routes: [
    ShellRoute(
      builder: (context, state, child) => MyShellScaffold(state: state, child: child),
      routes: [
        GoRoute(path: '/favoris', builder: (_, _) => Favoris()),
        GoRoute(path: '/tasks', builder: (_, _) => Tasks()),
        GoRoute(path: '/newList', builder: (_, _) => NewList()),
      ],
    ),
    GoRoute(path: '/details', builder: (context, state) => Details(),)
  ],
);

// pages reserves pour coder
class Favoris extends StatelessWidget {
  const Favoris({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Favoris"),);
  }
}

class Tasks extends StatelessWidget {
  const Tasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Tâches"),);
  }
}

class NewList extends StatelessWidget {
  const NewList({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Nouvelle Liste"),);
  }
}

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Details"),),);
  }
}