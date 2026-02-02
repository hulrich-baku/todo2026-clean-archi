import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_2026/app/presentation/pages/root_loading_page.dart';
import 'package:todo_2026/app/presentation/widgets/my_shell_scaffold.dart';
import 'package:todo_2026/features/onboarding/onbarding_providers.dart';

final routerProvider = Provider((ref) {
  // on écoute le contrôleur de l'onboarding
  final onboardingState = ref.watch(onboardingControllerProvider);

  return GoRouter(
    initialLocation: '/',
    redirect: (context, state) {
      if (onboardingState == null) return null;

      final isAtOnboarding = state.matchedLocation == '/onboarding';

      // L'utilisateur n'a pas vu l'onboarding et il n'est pas sur la page d'onboarding
      if (!onboardingState && !isAtOnboarding) return '/onboarding';

      // L'utilisateur a vu l'onboarding et il est encore sur la même page
      // il est redirigé vers la page 'tasks'
      if (onboardingState && isAtOnboarding) return '/tasks';

      return null;
    },
    routes: [
      ShellRoute(
        builder: (context, state, child) =>
            MyShellScaffold(state: state, child: child),
        routes: [
          GoRoute(path: '/favoris', builder: (_, _) => Favoris()),
          GoRoute(path: '/tasks', builder: (_, _) => Tasks()),
          GoRoute(path: '/newList', builder: (_, _) => NewList()),
        ],
      ),
      GoRoute(path: '/', builder: (context, state) => RootLoadingPage()),
      GoRoute(path: '/details', builder: (context, state) => Details()),
    ],
  );
});

// pages reserves pour coder
class Favoris extends StatelessWidget {
  const Favoris({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Favoris"));
  }
}

class Tasks extends StatelessWidget {
  const Tasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Tâches"));
  }
}

class NewList extends StatelessWidget {
  const NewList({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Nouvelle Liste"));
  }
}

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Details")));
  }
}
