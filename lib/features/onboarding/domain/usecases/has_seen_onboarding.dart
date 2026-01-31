import 'package:todo_2026/features/onboarding/domain/repository/onboarding_repository.dart';

class HasSeenOnboarding {
  final OnboardingRepository repository;

  HasSeenOnboarding(this.repository);

  Future<bool> call() => repository.hasSeenOnboarding();
}