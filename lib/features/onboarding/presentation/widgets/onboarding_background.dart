import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nivo/features/onboarding/presentation/theme/onboarding_palette.dart';

/// Ambient themed background canvas for the onboarding flow.
class OnboardingBackground extends StatelessWidget {
  const OnboardingBackground({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final palette = OnboardingPalette.of(context);

    return ColoredBox(
      color: palette.scaffoldBackground,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: -120.h,
            left: -80.w,
            child: IgnorePointer(
              child: Container(
                width: 300.w,
                height: 300.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      palette.ambientGlowTop,
                      palette.ambientGlowTop.withValues(alpha: 0),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -140.h,
            right: -90.w,
            child: IgnorePointer(
              child: Container(
                width: 320.w,
                height: 320.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      palette.ambientGlowBottom,
                      palette.ambientGlowBottom.withValues(alpha: 0),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SafeArea(child: child),
        ],
      ),
    );
  }
}
