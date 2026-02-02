import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_2026/features/onboarding/domain/usecases/has_seen_onboarding.dart';
import 'package:todo_2026/features/onboarding/domain/usecases/mark_onboarding_compled.dart';

class OnboardingController extends StateNotifier<bool?> {
  final HasSeenOnboarding _hasSeen;
  final MarkOnboardingCompled _markCompleted;

  OnboardingController(this._hasSeen, this._markCompleted) : super(null){
    _load();
  }

  Future<void> _load() async {
    state = await _hasSeen();
  }

  Future<void> completed() async {
    await _markCompleted();
    state = true;
  }
}