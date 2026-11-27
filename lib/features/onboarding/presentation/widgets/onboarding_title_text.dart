import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:nivo/core/theme/app_texts/app_text_styles.dart';
import 'package:nivo/features/onboarding/presentation/animations/onboarding_motion_config.dart';
import 'package:nivo/features/onboarding/presentation/theme/onboarding_palette.dart';

/// Animated headline text for onboarding pages.
class OnboardingTitleText extends StatelessWidget {
  const OnboardingTitleText({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final palette = OnboardingPalette.of(context);
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    return FadeInUp(
      from: 16,
      duration: OnboardingMotionConfig.titleDuration,
      delay: OnboardingMotionConfig.titleDelay,
      curve: OnboardingMotionConfig.entranceCurve,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: AppTextStyles.font24Bold.copyWith(
          color: palette.titleColor,
          height: 1.3,
          letterSpacing: isRtl ? 0 : null,
        ),
      ),
    );
  }
}
