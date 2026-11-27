import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nivo/features/onboarding/presentation/animations/onboarding_motion_config.dart';
import 'package:nivo/features/onboarding/presentation/theme/onboarding_palette.dart';

/// Animated page indicator dots that adapt naturally to LTR and RTL layouts.
class OnboardingPageIndicator extends StatelessWidget {
  const OnboardingPageIndicator({
    super.key,
    required this.pageCount,
    required this.currentIndex,
    this.onDotTap,
  });

  final int pageCount;
  final int currentIndex;
  final ValueChanged<int>? onDotTap;

  @override
  Widget build(BuildContext context) {
    final palette = OnboardingPalette.of(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(pageCount, (index) {
        final isActive = index == currentIndex;

        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onDotTap != null ? () => onDotTap!(index) : null,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
            child: AnimatedContainer(
              duration: OnboardingMotionConfig.indicatorDuration,
              curve: OnboardingMotionConfig.entranceCurve,
              width: isActive ? 24.w : 7.w,
              height: 7.h,
              decoration: BoxDecoration(
                color: isActive
                    ? palette.activeIndicatorColor
                    : palette.inactiveIndicatorColor,
                borderRadius: BorderRadius.circular(100.r),
              ),
            ),
          ),
        );
      }),
    );
  }
}
