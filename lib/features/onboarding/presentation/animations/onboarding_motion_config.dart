import 'package:flutter/animation.dart';

/// Shared timing, stagger, and curve configuration for onboarding animations.
class OnboardingMotionConfig {
  const OnboardingMotionConfig._();

  static const Duration mascotDuration = Duration(milliseconds: 550);
  static const Duration titleDuration = Duration(milliseconds: 450);
  static const Duration bodyDuration = Duration(milliseconds: 500);
  static const Duration stepDuration = Duration(milliseconds: 440);
  static const Duration ctaDuration = Duration(milliseconds: 480);
  static const Duration secondaryActionDuration = Duration(milliseconds: 420);
  static const Duration indicatorDuration = Duration(milliseconds: 350);
  static const Duration pageTransitionDuration = Duration(milliseconds: 420);

  static const Duration mascotDelay = Duration(milliseconds: 40);
  static const Duration titleDelay = Duration(milliseconds: 140);
  static const Duration bodyDelay = Duration(milliseconds: 220);
  static const Duration ctaDelay = Duration(milliseconds: 300);
  static const Duration workflowCtaDelay = Duration(milliseconds: 430);
  static const Duration secondaryActionDelay = Duration(milliseconds: 380);
  static const Duration workflowSecondaryActionDelay =
      Duration(milliseconds: 500);

  /// Returns a staggered entrance delay for a step or paragraph at [index].
  static Duration staggeredDelay(int index, {int baseMs = 200, int stepMs = 90}) {
    return Duration(milliseconds: baseMs + (index * stepMs));
  }

  static const Curve entranceCurve = Curves.easeOutCubic;
  static const Curve zoomCurve = Curves.easeOutBack;
  static const Curve pageCurve = Curves.easeInOutCubic;
}
