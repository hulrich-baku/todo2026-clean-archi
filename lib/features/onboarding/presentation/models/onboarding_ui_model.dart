import 'package:flutter/material.dart';

class OnboardingSlide {
  final String title;
  final String description;
  final IconData icon;

  const OnboardingSlide({
    required this.title,
    required this.icon,
    required this.description,
  });
}

const List<OnboardingSlide> onboardingSlides = [
  OnboardingSlide(
    title: "Ajouter une tâche",
    description:
        "Organise ta journée en un instant. Une simple tâche peut changer ton rythme.",
    icon: Icons.add_task,
  ),
  OnboardingSlide(
    title: "Valider une tâche",
    description:
        "Coche chaque tâche accomplie et savoure ta progression. Petit à petit, tu construis du vrai momentum.",
    icon: Icons.check_circle,
  ),
  OnboardingSlide(
    title: "Ne rien oublier",
    description:
        "Active des rappels pour rester maître de ton temps. L’application t’accompagne, toi tu avances.",
    icon: Icons.notifications_active,
  ),
];
