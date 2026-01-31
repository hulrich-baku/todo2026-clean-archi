import 'package:todo_2026/features/onboarding/data/onboarding_local_datasource.dart';
import 'package:todo_2026/features/onboarding/domain/repository/onboarding_repository.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  final OnboardingLocalDatasource localDatasource;

  OnboardingRepositoryImpl(this.localDatasource);

  @override
  Future<bool> hasSeenOnboarding() => localDatasource.getSatus();

  @override
  Future<void> markOnboardingCompleted() => localDatasource.saveStatus();
} 

