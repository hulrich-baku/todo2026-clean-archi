import 'package:todo_2026/features/onboarding/domain/repository/onboarding_repository.dart';

class MarkOnboardingCompled {
  final OnboardingRepository repository;

  MarkOnboardingCompled(this.repository);

  Future<void> call() => repository.markOnboardingCompleted();
}