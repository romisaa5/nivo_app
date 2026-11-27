import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nivo/core/theme/app_texts/app_text_styles.dart';
import 'package:nivo/features/onboarding/presentation/theme/onboarding_palette.dart';

/// Pill-shaped status badge displayed inside experimental workflow steps.
class OnboardingExperimentalBadge extends StatelessWidget {
  const OnboardingExperimentalBadge({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    final palette = OnboardingPalette.of(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: palette.badgeBackground,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: palette.badgeBorder,
          width: 1.w,
        ),
      ),
      child: Text(
        label,
        style: AppTextStyles.font12SemiBold.copyWith(
          fontSize: 11.sp,
          color: palette.badgeTextColor,
          letterSpacing: 0.2,
        ),
      ),
    );
  }
}
