/// Data model representing a single step item displayed on the workflow
/// onboarding page.
class OnboardingStepItem {
  const OnboardingStepItem({
    required this.text,
    this.badgeText,
  });

  final String text;
  final String? badgeText;
}
