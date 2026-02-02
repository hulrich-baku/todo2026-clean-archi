import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_2026/features/onboarding/onbarding_providers.dart';

class RouterRefresh extends ChangeNotifier {
  RouterRefresh(Ref ref){
    ref.listen<bool?>(
      onboardingProvider, (_,_) => notifyListeners()
    );
  }
}