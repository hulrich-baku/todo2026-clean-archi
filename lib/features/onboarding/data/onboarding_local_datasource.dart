import 'package:shared_preferences/shared_preferences.dart';

class OnboardingLocalDatasource {
  
  static const String _keyOnboarding = 'has_seen_onboarding';

  Future<bool> getSatus () async {
    final preferences = await SharedPreferences.getInstance();
    
    return preferences.getBool(_keyOnboarding) ?? false;
  }

  Future<void> saveStatus () async {
    final preferences = await SharedPreferences.getInstance();

    preferences.setBool(_keyOnboarding, true);
  }
}