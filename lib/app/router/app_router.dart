import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_2026/app/presentation/pages/root_loading_page.dart';
import 'package:todo_2026/app/presentation/widgets/my_shell_scaffold.dart';
import 'package:todo_2026/app/router/router_refresh.dart';
import 'package:todo_2026/features/onboarding/onbarding_providers.dart';
import 'package:todo_2026/features/onboarding/presentation/pages/onboarding_page.dart';

final routerProvider = Provider((ref) {
  return GoRouter(
    initialLocation: '/loading',
    refreshListenable: RouterRefresh(ref),
    redirect: (context, state) {
      // on écoute le contrôleur de l'onboarding
      final onboardingState = ref.watch(onboardingProvider);

      // 1. Si l'état est null → on laisse la page de loading
      if (onboardingState == null) {
        if (state.uri.path == '/loading') return null;
        return '/loading'; // On force vers loading
      }

      // 2. Onboarding pas encore vu
      if (onboardingState == false) {
        if (state.uri.path != '/onboarding') return '/onboarding';
        return null;
      }

      // 3. Onboarding déjà vu
      if (onboardingState == true) {
        // empêcher retour sur onboarding
        if (state.uri.path == '/onboarding') return '/tasks';

        // sortir de loading
        if (state.uri.path == '/loading') return '/tasks';

        return null;
      }

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
      GoRoute(path: '/loading', builder: (context, state) => RootLoadingPage()),
      GoRoute(path: '/onboarding', builder: (context, state) => OnboardingPage()),
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
