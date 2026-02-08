import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_2026/core/constants/constants.dart' show keyOnboarding;

class OnboardingLocalDatasource {

  Future<bool> getSatus () async {
    final preferences = await SharedPreferences.getInstance();
    
    return preferences.getBool(keyOnboarding) ?? false;
  }

  Future<void> saveStatus () async {
    final preferences = await SharedPreferences.getInstance();

    preferences.setBool(keyOnboarding, true);
  }
}