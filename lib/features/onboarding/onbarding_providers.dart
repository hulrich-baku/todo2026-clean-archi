import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_2026/features/onboarding/data/datasource/onboarding_local_datasource.dart';
import 'package:todo_2026/features/onboarding/data/repository_impl/onboarding_repository_impl.dart';
import 'package:todo_2026/features/onboarding/domain/usecases/has_seen_onboarding.dart';
import 'package:todo_2026/features/onboarding/domain/usecases/mark_onboarding_compled.dart';
import 'package:todo_2026/features/onboarding/presentation/provider/onboarding_controller.dart';

// INJECTION DES DEPENDANCES

final onboardingProvider = StateNotifierProvider<OnboardingController, bool?>(
  (ref) {
    final datasource = OnboardingLocalDatasource();
    final repository = OnboardingRepositoryImpl(datasource);

    return OnboardingController(
      HasSeenOnboarding(repository), MarkOnboardingCompled(repository)
    );
  }
);