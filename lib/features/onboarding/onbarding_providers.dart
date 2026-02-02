import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_2026/features/onboarding/data/datasource/onboarding_local_datasource.dart';
import 'package:todo_2026/features/onboarding/data/repository_impl/onboarding_repository_impl.dart';
import 'package:todo_2026/features/onboarding/domain/usecases/has_seen_onboarding.dart';
import 'package:todo_2026/features/onboarding/domain/usecases/mark_onboarding_compled.dart';
import 'package:todo_2026/features/onboarding/presentation/provider/onboarding_controller.dart';

// INJECTION DES DEPENDANCES

// 1. Les couches basses
final onboardingDatasource = Provider((ref) => OnboardingLocalDatasource());
final onboardingRepositoryProvider = Provider<OnboardingRepositoryImpl>(
  (ref) => OnboardingRepositoryImpl(ref.watch(onboardingDatasource))
);

// 2. Les use cases
final hasSeenOnboardingProvider = Provider(
  (ref) => HasSeenOnboarding(ref.watch(onboardingRepositoryProvider))
);
final markOnboardingCompletedProvider = Provider(
  (ref) => MarkOnboardingCompled(ref.watch(onboardingRepositoryProvider))
);


// 3. Le Notifier (Exposition à l'UI)
final onboardingControllerProvider = StateNotifierProvider<OnboardingController, bool?>(
  (ref) => OnboardingController(
    // _hasSeen ET _markCompleted
    ref.watch(hasSeenOnboardingProvider), ref.watch(markOnboardingCompletedProvider)
  )
);