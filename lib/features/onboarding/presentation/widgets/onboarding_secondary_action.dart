import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nivo/core/theme/app_texts/app_text_styles.dart';
import 'package:nivo/features/onboarding/presentation/animations/onboarding_motion_config.dart';
import 'package:nivo/features/onboarding/presentation/theme/onboarding_palette.dart';

/// Animated secondary text action button (e.g., "I have an account").
class OnboardingSecondaryAction extends StatelessWidget {
  const OnboardingSecondaryAction({
    super.key,
    required this.label,
    required this.onTap,
    this.delay,
  });

  final String label;
  final VoidCallback onTap;
  final Duration? delay;

  @override
  Widget build(BuildContext context) {
    final palette = OnboardingPalette.of(context);
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    return FadeIn(
      duration: OnboardingMotionConfig.secondaryActionDuration,
      delay: delay ?? OnboardingMotionConfig.secondaryActionDelay,
      curve: OnboardingMotionConfig.entranceCurve,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.r),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: AppTextStyles.font14Medium.copyWith(
              color: palette.secondaryActionColor,
              letterSpacing: isRtl ? 0 : null,
            ),
          ),
        ),
      ),
    );
  }
}
